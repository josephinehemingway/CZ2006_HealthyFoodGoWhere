import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/control/Authenticator.dart';
import 'package:flutter_app/entity/Recipe.dart';
import '../../widgets/animation.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/customCheckbox.dart';
import 'ProfileUI.dart';
import 'package:flutter_app/entity/CurrentUser.dart';

/// This is the boundary class which displays the User's Dietary Preferences in the mobile UI.
///
/// Consists of checkboxes for the user to indicate their dietary preferences.
class EditPreferences extends StatefulWidget {

  /// The route name for navigation to [EditPreferences].
  static String routeName = '/editPref';

  @override
  _EditPreferencesState createState() => _EditPreferencesState();
}

/// This class manages the state of the [EditPreferences].
///
/// Includes the business logic behind [EditPreferences].
class _EditPreferencesState extends State<EditPreferences> {

  /// Instantiating a new [CurrentUser] object.
  CurrentUser curUser = CurrentUser();

  /// Initializing the user's preference list from the Firebase Realtime Database.
  List<String> userPreferenceList = [];

  /// Initializing the user's preference list that is used to store user's preferences
  /// directly from the checkboxes when ticked.
  List<String> preferenceList = [];

  /// A list of dietary preferences used as conditions when filtering recipes
  /// from the API.
  List<String> dietList = [
    'Dairy Free',
    'Gluten Free',
    'Ketogenic',
    'Vegan',
    'Vegetarian',
    'Whole30'
  ];

  /// Widget Build method to implement [EditPreferences].
  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('Edit Dietary Preferences', context, ProfileUI()),
      body: ListView(children: [Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: double.infinity,

          // FutureBuilder method to obtain the user's dietary preferences from the Firebase Realtime Database.
          //
          // Database preferences will be stored in the [userPreferenceList].
          // This method repopulates the [preferenceList] with the database preferences
          // so as to initialise the initial checkbox state.
            child: Container(
              child: FutureBuilder<DataSnapshot>(
                future: FirebaseDatabase.instance.reference().child('User/${getUserID()}/preferences').once(),
                builder: (context,snapshot) {
                  if (snapshot.hasData && snapshot.data.value != null) {
                    Recipe recipe;
                    var userPreferenceList = snapshot.data.value;

                    for (int i = 0; i < userPreferenceList.length; i++) {
                      if (userPreferenceList[i] == "Dairy Free") {
                        preferenceList.add("Dairy Free");
                      }
                      if (userPreferenceList[i] == "Gluten Free") {
                        preferenceList.add("Glutten Free");
                      }
                      if (userPreferenceList[i] == "Ketogenic") {
                        preferenceList.add("Ketogenic");
                      }
                      if (userPreferenceList[i] == "Vegan") {
                        preferenceList.add("Vegan");
                      }
                      if (userPreferenceList[i] == "Vegetarian") {
                        preferenceList.add("Vegetarian");
                      }
                      if (userPreferenceList[i] == "Whole30") {
                        preferenceList.add("Whole30");
                      }
                      print(preferenceList);
                    }
                  }
                  return Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        FadeAnimation(1.2, customCheckBox(
                            title: dietList[0], list: preferenceList)),
                        FadeAnimation(1.2, customCheckBox(
                            title: dietList[1], list: preferenceList)),
                        FadeAnimation(1.2, customCheckBox(
                            title: dietList[2], list: preferenceList)),
                        FadeAnimation(1.2, customCheckBox(
                            title: dietList[3], list: preferenceList)),
                        FadeAnimation(1.2, customCheckBox(
                            title: dietList[4], list: preferenceList)),
                        FadeAnimation(1.2, customCheckBox(
                            title: dietList[5], list: preferenceList)),
                        SizedBox(height: 60,),
                      ]

                  );
                }
            )
            )
        )
  ]
  ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile));


}
