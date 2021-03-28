import 'package:flutter_app/screens/Profile/EditPreferencesUI.dart';
import 'auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/screens/Eateries/googleMapUI.dart';

class CurrentUser {
  String _id;
  String _name;
  String _email;
  String _profilePic;
  LatLng _curlocation;

  List <String> _dietaryPref = ["Vegetarian"];

  void printCurrentUser(){
    print(
        "\nUserID: " + id +
            "\nUser Name: " + name +
            "\nUser Email: " + email +
            "\nUser PhotoURL: " + profilePic +
            "\nUser Dietary Pref: " + dietList.toString() +
            "\nUser Current Location: " + curlocation.toString()

    );
  }

  LatLng get curlocation => _curlocation;

  set curlocation(LatLng value) {
    _curlocation = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get profilePic => _profilePic;

  set profilePic(String value) {
    _profilePic = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }


  void setDietPref(List<String> dietList){
    _dietaryPref = dietList;
  }

  List <String> get dietList => _dietaryPref;

}

