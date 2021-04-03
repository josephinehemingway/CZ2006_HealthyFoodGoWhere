import 'package:google_maps_flutter/google_maps_flutter.dart';

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