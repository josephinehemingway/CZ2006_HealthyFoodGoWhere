import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn  googleSignIn = GoogleSignIn();

Future<FirebaseUser> signIn() async{

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}

void signOut() async{
  await googleSignIn.signOut();
  _auth.signOut();



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