import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Profile/ProfileMenu.dart';
import 'package:flutter_app/screens/Profile/ProfilePic.dart';
import 'package:flutter_app/widgets/my_flutter_app_icons.dart';
import '../../animation.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
        FadeAnimation_Y(1,ProfilePic()),
          SizedBox(height: 20),
        FadeAnimation_Y(1,Text("Kenn Lim", style: TextStyle( //name
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),)),
          SizedBox(height: 2),
        FadeAnimation_Y(1,Text("kennlim@gmail.com", style: TextStyle( //email
              fontSize: 20,
          ),)),
          SizedBox(height: 20),

          // FadeAnimation_Y(1,Text("Preferences", style: TextStyle( //name
          //     fontSize: 28,
          //     fontWeight: FontWeight.bold
          // ),)),

        FadeAnimation_Y(1,ProfileMenu(
            text: "My Account",
            icon: Icon(Icons.person),
            press: () => {},
          )),
          FadeAnimation_Y(1,ProfileMenu(
            text: "My Dietary Preferences",
            icon: Icon(MyFlutterApp.cutlery),
            press: () => {},
          )),
          FadeAnimation_Y(1,ProfileMenu(
            text: "Log Out",
            icon: Icon(Icons.logout),
            press: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/login')
            },
          )),
        ],
      ),
    );
  }
}