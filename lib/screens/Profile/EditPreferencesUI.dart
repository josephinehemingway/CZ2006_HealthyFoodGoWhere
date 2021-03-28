import 'package:flutter/material.dart';
import 'package:flutter_app/animation.dart';
import 'package:flutter_app/widgets/bottomNavBar.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:flutter_app/widgets/customCheckbox.dart';
import 'ProfileUI.dart';
import 'package:flutter_app/widgets/ProfileWidgets/ProfileMenu.dart';
import 'package:flutter_app/CurrentUser.dart';


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
            child: Column(
                children: <Widget>[
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[0],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[1],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[2],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[3],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[4],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[5],list: preferenceList)),
                  saveButton(context, userPreferenceList, curUser),
                  SizedBox(height: 20,),
                  ]
            )
        )
  ]
  ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile));


}
