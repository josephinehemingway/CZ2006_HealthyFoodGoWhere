import 'package:flutter/material.dart';
import 'package:flutter_app/animation.dart';
import 'package:flutter_app/widgets/bottomNavBar.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:flutter_app/widgets/customCheckbox.dart';
import 'package:flutter_app/screens/Profile/Profile.dart';

class EditIntolerance extends StatefulWidget {
  static String routeName = '/editIntolerance';

  @override
  _EditIntoleranceState createState() => _EditIntoleranceState();
}

class _EditIntoleranceState extends State<EditIntolerance> {

  List<String> userIntolerancesList = [];

  List<String> intoleranceList = [
    'Dairy',
    'Egg',
    'Gluten',
    'Grain',
    'Peanut',
    'Seafood',
    'Sesame',
    'Shellfish',
    'Soy',
    'Sulfite',
    'Tree Nut',
    'Wheat',
  ];


  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar('Edit Intolerances', context, Profile()),
      body: ListView(children: [Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: double.infinity,
          child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                FadeAnimation_Y(1, Text("My Intolerances", style: TextStyle(
                  fontSize: 22,),)),
                SizedBox(height: 20,),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[0],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[1],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[2],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[3],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[4],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[5],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[6],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[7],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[8],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[9],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[10],list: userIntolerancesList)),
                FadeAnimation_Y(1.2, customCheckBox(title: intoleranceList[11],list: userIntolerancesList)),

              ]
          )
      )
      ]
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile));


}
