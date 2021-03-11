import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Profile/EditIntoleranceUI.dart';
import 'package:flutter_app/screens/Profile/EditPreferencesUI.dart';


class User {

  User({
    this.name,
    this.email,
    this.profilePic,
    this.intolerances,
    this.dietaryPref
  });

  String name;
  String email;
  String profilePic;
  List <String> intolerances;
  List <String> dietaryPref;




}

