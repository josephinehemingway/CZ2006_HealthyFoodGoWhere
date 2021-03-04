import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import 'package:provider/provider.dart';


class GoogleSignInButton extends StatelessWidget {
  FirebaseUser user;
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
          signIn().then((user) =>
          {
            this.user = user,
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())
          )
          });
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
