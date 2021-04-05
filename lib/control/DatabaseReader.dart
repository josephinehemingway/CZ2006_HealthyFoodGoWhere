import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/control/Authenticator.dart';

/// Configuring to the database using a file
final databaseReference = FirebaseDatabase.instance.reference();
///This is a control class to read data from Realtime Database
class Database {
  /// Create preferences [String] using List [dietList] from Realtime Database
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

}

/// A method to return user ID
///
/// Returns id ['String'].
Future<String> _getAccountKey(String id) async{
  return id;
}