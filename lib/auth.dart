import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn  googleSignIn = GoogleSignIn();

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

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;

}
getProfilePic(){
    if (_auth.currentUser.photoURL != null) {
      return NetworkImage(_auth.currentUser.photoURL.toString());
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
}

getProfileName(){
  return _auth.currentUser.displayName.toString();
}

getEmail(){
  return _auth.currentUser.email.toString();
}
Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();

  print("User Signed Out");
}
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class GoogleAuth extends ChangeNotifier {
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   bool _isSigningIn;
//
//   GoogleAuth(){
//     _isSigningIn = false;
//   }
//
//   bool get isSigningIn => _isSigningIn;
//
//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }
//
//   Future signIn() async {
//     isSigningIn = true;
//
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//
//     if (GoogleSignInAccount == null) {
//       isSigningIn = false;
//       return;
//     } else {
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
//           .authentication;
//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);
//
//       await _auth.signInWithCredential(credential);
//       isSigningIn = false;
//     }
//   }
//
//   void signOut() async {
//     await googleSignIn.signOut();
//     _auth.signOut();
//   }
// }