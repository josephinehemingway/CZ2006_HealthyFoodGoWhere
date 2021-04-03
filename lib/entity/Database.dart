import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/control/Authenticator.dart';
import 'CurrentUser.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class Database {
  static Future<String> createPreferences(List dietList) async{
    String accountKey = await _getAccountKey(getUserID());
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

  static Future<void> savePreferences(CurrentUser user, List preferences) async{
    String accountKey = await _getAccountKey(user.id);
    return FirebaseDatabase.instance
        .reference()
        .child("User")
        .child(accountKey)
        .child("preferences")
        .set(preferences);

  }
}

Future<String> _getAccountKey(String id) async{
  return id;
}