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

  List <dynamic> dietaryPref = [];

  CurrentUser({
    this.id,
    this.name,
    this.email,
    this.profilePic,
    this.curlocation,
    this.dietaryPref
  });

}