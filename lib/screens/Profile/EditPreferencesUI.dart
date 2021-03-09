import 'package:flutter/material.dart';
import 'package:flutter_app/animation.dart';
import 'package:flutter_app/widgets/bottomNavBar.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:flutter_app/widgets/customCheckbox.dart';
import 'Profile.dart';

class EditPreferences extends StatefulWidget {
  static String routeName = '/editPref';
  @override
  _EditPreferencesState createState() => _EditPreferencesState();
}

class _EditPreferencesState extends State<EditPreferences> {

  List<String> preferenceList = [];
  List<String> dietList = [
    'Vegetarian',
    'Vegan',
    'Gluten Free',
    'Ketogenic',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Pescetarian',
    'Paleo',
    'Primal',
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
                    SizedBox(height: 20,),
                    FadeAnimation_Y(1, Text("Dietary Preferences", style: TextStyle(
                    fontSize: 22,),)),
                    SizedBox(height: 20,),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[0],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[1],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[2],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[3],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[4],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[5],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[6],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[7],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[8],list: preferenceList)),
                  FadeAnimation_Y(1.2, customCheckBox(title: dietList[9],list: preferenceList)),
                  ]
            )
        )
  ]
  ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile));


}
