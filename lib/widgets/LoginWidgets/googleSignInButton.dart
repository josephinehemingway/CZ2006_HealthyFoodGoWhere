import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/screens/Home/HomeUI.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/CurrentUser.dart';

class GoogleSignInButton extends StatelessWidget {
  User user;
  CurrentUser curUser = CurrentUser();

  @override
  Widget build(BuildContext context) =>
      MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width * 0.6,
        height: MediaQuery
            .of(context)
            .size
            .width * 0.15,
        onPressed: () {
          // final provider = Provider.of<GoogleAuth>(context, listen: false);
          // provider.signIn();
          // Navigator.pop(context);
          signInWithGoogle().then((result) =>
          { if(result!=null){
            this.user = user,
            curUser.name = getProfileName(),
            curUser.email = getEmail(),
            curUser.id = getUserID(),
            curUser.profilePic = getUserImageURL(),

            curUser.printCurrentUser(),
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())
          )
          }});
        },
        color: Colors.teal[200],
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text("Login via Gmail", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'GlacialIndifference'
        ),),
      );
}
