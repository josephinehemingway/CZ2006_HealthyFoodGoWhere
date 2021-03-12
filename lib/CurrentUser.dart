import 'package:flutter_app/screens/Profile/EditIntoleranceUI.dart';
import 'package:flutter_app/screens/Profile/EditPreferencesUI.dart';
import 'auth.dart';

class CurrentUser {
  String _id;
  String _name;
  String _email;
  String _profilePic;
  List <String> _intolerances = [];
  List <String> _dietaryPref = [];

  void printCurrentUser(){
    print(
        "\nUserID: " + id +
            "\nUser Name: " + name +
            "\nUser Email: " + email +
            "\nUser PhotoURL: " + profilePic +
            "\nUser Intolerances: " + intolList.toString() +
            "\nUser Dietary Pref: " + dietList.toString()

    );
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

  void setIntolerances(List<String> intolList){
    _intolerances = intolList;
  }

  List <String> get intolList => _intolerances;

  void setDietPref(List<String> dietList){
    _dietaryPref = dietList;
  }

  List <String> get dietList => _dietaryPref;

}

