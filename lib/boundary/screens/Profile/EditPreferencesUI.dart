import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Database.dart';
import 'package:flutter_app/entity/Recipe.dart';
import '../../widgets/animation.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/customCheckbox.dart';
import '../../widgets/ProfileWidgets/ProfileMenu.dart';
import 'ProfileUI.dart';
import 'package:flutter_app/entity/CurrentUser.dart';


class EditPreferences extends StatefulWidget {
  static String routeName = '/editPref';
  @override
  _EditPreferencesState createState() => _EditPreferencesState();
}

class _EditPreferencesState extends State<EditPreferences> {

  CurrentUser curUser = CurrentUser();
  List<String> userPreferenceList = [];

  List<String> preferenceList = [];
  List<String> dietList = [
    'Dairy Free',
    'Gluten Free',
    'Ketogenic',
    'Vegan',
    'Vegetarian',
    'Whole30'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('Edit Dietary Preferences', context, Profile()),
      body: ListView(children: [Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: double.infinity,
            child: Container(
              child: FutureBuilder<DataSnapshot>(
                future: FirebaseDatabase.instance.reference().child('User/2PAXMOZP8BczhLxXgcKU2bZhOBt2/preferences').once(),
                builder: (context,snapshot) {
                  if (snapshot.hasData && snapshot.data.value != null) {
                    Recipe recipe;
                    var userPreferenceList = snapshot.data.value;
                    // var dairyFree = false;
                    // var glutenFree = false;
                    // var ketogenic = false;
                    // var vegan = false;
                    // var vegetarian = false;
                    // var whole30 = false;

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
                        FadeAnimation_Y(1.2, customCheckBox(
                            title: dietList[0], list: preferenceList)),
                        FadeAnimation_Y(1.2, customCheckBox(
                            title: dietList[1], list: preferenceList)),
                        FadeAnimation_Y(1.2, customCheckBox(
                            title: dietList[2], list: preferenceList)),
                        FadeAnimation_Y(1.2, customCheckBox(
                            title: dietList[3], list: preferenceList)),
                        FadeAnimation_Y(1.2, customCheckBox(
                            title: dietList[4], list: preferenceList)),
                        FadeAnimation_Y(1.2, customCheckBox(
                            title: dietList[5], list: preferenceList)),
                        SizedBox(height: 60,),
                        FadeAnimation_Y(1.2,
                            saveButton(context, userPreferenceList, curUser)),
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
