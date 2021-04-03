import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

///Instantiate FirebaseAuthenication instance
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn  googleSignIn = GoogleSignIn();

/// A method for Google sign in to check for authentication
Future<String> signInWithGoogle() async{
  //Triger authetication flow
  await Firebase.initializeApp();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded');

    return '$user';
  }
  return null;
}

/// Getter for Firebase user's user ID [uid].
String getUserID(){
  return _auth.currentUser.uid;
}

/// Getter for Firebase user's profile image URL [photoURL].
String getUserImageURL(){
  return _auth.currentUser.photoURL;
}

/// Getter for Firebase user's profile image.
getProfilePic(){
    if (_auth.currentUser.photoURL != null) {
      return NetworkImage(_auth.currentUser.photoURL.toString());
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
}

/// Getter for Firebase user's display name [displayName].
getProfileName(){
  return _auth.currentUser.displayName.toString();
}

/// Getter for Firebase user's email [email].
getEmail(){
  return _auth.currentUser.email.toString();
}

/// Method to sign out.
Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();

  print("User Signed Out");
}
