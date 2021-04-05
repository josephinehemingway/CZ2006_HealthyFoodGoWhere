import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/control/Authenticator.dart';

///This is a control class to write data to Realtime Database.
///
/// Writes User's checked preferences.
class WritePreferences {

  /// Create preferences [String] using List [dietList] from Realtime Database
  static Future<String> createPreferences(List dietList) async{
    String accountKey = await getUserID();
    List preference = dietList;
    var preferences = <String, dynamic>{
      'preferences' : preference
    };

    DatabaseReference reference = FirebaseDatabase.instance
      .reference()
      .child("User")
      .child(accountKey);

    reference.set(preferences);
    return reference.key;
  }
}