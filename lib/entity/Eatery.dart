import 'package:flutter_app/entity/CurrentUser.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This is an entity class that instantiates a [Eatery] object.
class Eatery implements Comparable{

  /// The [Eatery]'s name.
  String name;

  /// The [Eatery]'s address.
  String address;

  /// The [Eatery]'s description.
  String description;

  /// The [Eatery]'s thumbnail image.
  String thumbNail;

  /// The [Eatery]'s location [LatLng] coordinates.
  LatLng locationCoords;

  /// The [Eatery]'s distance from [CurrentUser]'s current location in km.
  double distancefromuser;

  /// The constructor for [Eatery].
  Eatery(
      {this.name,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords,
      this.distancefromuser
      });

  /// A method to return the [Eatery] object's name and distance from [CurrentUser].
  @override
  String toString(){
    return '{ ${this.name}, ${this.distancefromuser}';
  }

  /// A method to compare the distance of [Eatery] objects from [CurrentUser]'s current location.
  ///
  /// Used to sort the [Eatery] list in order of distance from [CurrentUser].
  /// Returns 1 if distance of this [Eatery] is smaller than that of the other [Eatery] object.
  /// Returns -1 if distance of this [Eatery] is greater than that of the other [Eatery] object.
  /// Returns 0 if distance of both [Eatery] objects is the same.
  int compareTo(other) {
    if (this.distancefromuser == null || other == null) {
      return null;
    }
    if (this.distancefromuser < other.distancefromuser) {
      return 1;
    }
    if (this.distancefromuser > other.distancefromuser) {
      return -1;
    }
    if (this.distancefromuser == other.distancefromuser) {
      return 0;
    }

    return null;
  }
}
