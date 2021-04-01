import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/boundary/screens/Profile/EditPreferencesUI.dart';
import '../Database.dart';
import '../control/Authenticator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/boundary/screens/Eateries/googleMapUI.dart';

class CurrentUser {
  String id;
  String name;
  String email;
  String profilePic;
  LatLng curlocation;

  List <String> dietaryPref = [];
  CurrentUser({
    this.id,
    this.name,
    this.email,
    this.profilePic,
    this.curlocation,
    this.dietaryPref
});


  void printCurrentUser(){

    //print(readPreferences(getUserID()));
    // print("diiz" +  dietaryPref.toString());
  }

  // LatLng get curlocation => _curlocation;
  //
  // set curlocation(LatLng value) {
  //   _curlocation = value;
  // }
  //
  // String get id => _id;
  //
  // set id(String value) {
  //   _id = value;
  // }
  //
  // String get name => _name;
  //
  // set name(String value) {
  //   _name = value;
  // }
  //
  // String get profilePic => _profilePic;
  //
  // set profilePic(String value) {
  //   _profilePic = value;
  // }
  //
  // String get email => _email;
  //
  // set email(String value) {
  //   _email = value;
  // }
  //
  //
  // void setDietPref(List<String> dietList){
  //   _dietaryPref = dietList;
  //
  // }
  //
  // List <String> get dietList => _dietaryPref;
  // List<CurrentUser> list = [];
  // final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  // //DatabaseReference ref = database.getReference("server/saving-data/fireblog/posts");
  // getList() async{
  //   await databaseReference.child('User/$id/preferences').once().then((
  //       DataSnapshot dataSnapshot) {
  //     dataSnapshot.value.forEach((value) {
  //
  //       CurrentUser user = CurrentUser.fromJson(dataSnapshot.value);
  //       list.add(user);
  //     });
      //     for(var value in dataSnapshot.value){
      //       list.add(new CurrentUser.fromJson(value));
      //     }
      //
      // });
  //   });
  //   print(list);
  // }
  // void readPreferences(String id){
  //
  //   databaseReference.child('User/$id/preferences').once().then((
  //   DataSnapshot dataSnapshot){
  //     Map<String,String> td=(HashMap<String, String>)dataSnapshot.value();
  //     dietaryPref= dataSnapshot.value;
  //
  //
  //       });
  // }
  //  print(dataSnapshot.value);
  //
  //   });
  //
  //   }
  //
  // static Future<StreamSubscription<Event>> getPreferences(String id,
  // void onData(List<String> preference)) async{
  //   StreamSubscription<Event> subscription = FirebaseDatabase.instance
  //       .reference()
  //       .child("User")
  //       .child(id)
  //       .child("preferences")
  //       .onValue
  //       .listen((Event event) {
  //         List<String> preference = event.snapshot.value as List<String>;
  //         if(preference == null){
  //           preference = [];
  //         }
  //         onData(preference);
  //   });
  // return subscription;
  //
  // }
  // Future<CurrentUser> getPreferences(String id) async{
  //   Map<String, dynamic> parameters = {
  //       "preferences": dietaryPref,
  //   };
  //   final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('User/$id/preferences');
  //
  //   final jsonPreferences = jsonDecode(parameters['preferences'])as List<dynamic>).cast<String>();
  //     CurrentUser.fromJson(Map<String, dynamic> data){
  //       dietaryPref = (jsonDecode(data['preferences'])as List<dynamic>).cast<String>();
  //     };
  // }





  // CurrentUser user;

  // void readPreferences(String id) {
  //   databaseReference.child('User/$id/preferences').once().then((
  //             DataSnapshot dataSnapshot) {
  //
  //   var childKey = dataSnapshot.key;
  //   var childData = dataSnapshot.value();
  // print(childKey);
  //     print(childData);
  // });
  // }

  // void readPrefernces(String id) {
  //   databaseReference.child('User/$id/preferences').once().then((
  //       DataSnapshot dataSnapshot) {
  //
  //     dietaryPref = dataSnapshot.value;
  //     print(dietaryPref);
  //   });
  // }



}
