import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';
import 'package:flutter_app/screens/Profile/UI%20components/ProfileMenu.dart';
import 'package:flutter_app/screens/Profile/UI%20components/ProfilePic.dart';
import 'package:flutter_app/widgets/my_flutter_app_icons.dart';
import '../../../animation.dart';

//Profile Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
        FadeAnimation_Y(1,ProfilePic()),

          SizedBox(height: 20),

        FadeAnimation_Y(1,Text(getProfileName(), style: TextStyle( //name
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),)),

          SizedBox(height: 2),

        FadeAnimation_Y(1,Text(getEmail(), style: TextStyle( //email
              fontSize: 18,
          ),)),

          SizedBox(height: 20),

        FadeAnimation_Y(1,ProfileMenu(
            text: "My Intolerances",
            icon: Icon(Icons.dangerous),
            press: () => {
              Navigator.pop(context),
            Navigator.pushNamed(context, '/editIntolerance')},
          )),

          FadeAnimation_Y(1,ProfileMenu(
            text: "My Dietary Preferences",
            icon: Icon(MyFlutterApp.cutlery),
            press: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/editPref')
            },
          )),

          FadeAnimation_Y(1,ProfileMenu(
            text: "Log Out",
            icon: Icon(Icons.logout),
            press: () => {
              signOutGoogle(),
              Navigator.pop(context),
              Navigator.pushNamed(context, '/login')
            },
          )),
        ],
      ),
    );
  }
}