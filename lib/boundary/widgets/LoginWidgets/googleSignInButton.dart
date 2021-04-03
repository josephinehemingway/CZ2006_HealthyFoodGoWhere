import 'package:flutter/material.dart';
import 'package:flutter_app/control/Authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/boundary/screens/Home/HomeUI.dart';
import 'package:flutter_app/entity/CurrentUser.dart';

/// This is the boundary class which displays the 'Sign in with Gmail' button in the Login Screen.
///
/// Used in [LoginUI].
class GoogleSignInButton extends StatelessWidget {

  /// Instantiates the Firebase User for authentication.
  User user;

  /// Instantiating a new [CurrentUser] object.
  CurrentUser curUser = CurrentUser();

  /// Widget Build method for the [GoogleSignInButton]
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
          /// SignIn with Google process.
          signInWithGoogle().then((result) => {

            if(result!=null){
              // initialising the user.
              this.user = user,
              curUser.name = getProfileName(),
              curUser.email = getEmail(),
              curUser.id = getUserID(),
              curUser.profilePic = getUserImageURL(),

              Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeUI())
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
