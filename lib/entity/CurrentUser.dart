import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This is an entity class that instantiates a [CurrentUser] object.
class CurrentUser {

  /// The [CurrentUser]'s user ID.
  String id;

  /// The [CurrentUser]'s name.
  String name;

  /// The [CurrentUser]'s email
  String email;

  /// The [CurrentUser]'s profile picture.
  String profilePic;

  /// The [CurrentUser]'s current location in [LatLng] coordinates.
  LatLng curlocation;

  /// The [CurrentUser]'s list of dietary preferences.
  List <dynamic> dietaryPref = [];

  /// The constructor for [CurrentUser].
  CurrentUser({
    this.id,
    this.name,
    this.email,
    this.profilePic,
    this.curlocation,
    this.dietaryPref
  });

}