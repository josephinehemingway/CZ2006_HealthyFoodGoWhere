import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Profile/ProfileMenu.dart';
import 'package:flutter_app/screens/Profile/ProfilePic.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Text("Kenn Lim", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 2),
          Text("kennlim@gmail.com", style: TextStyle(
              fontSize: 20,
          ),),
          SizedBox(height: 20),

          ProfileMenu(
            text: "My Account",
            icon: Icon(Icons.person),
            press: () => {},
          ),
        ],
      ),
    );
  }
}