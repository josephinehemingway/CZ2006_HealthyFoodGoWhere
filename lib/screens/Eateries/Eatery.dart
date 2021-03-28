// class Eatery {
//   String _name;
//   String _address;
//   double _latitude;
//   double _longitude;
//   double _distanceFromUser;
//   Eatery(
//       {String name,
//       String address,
//       double latitude,
//       double longitude,
//       double distanceFromUser}) {
//     _name = name;
//     _address = address;
//     _latitude = latitude;
//     _longitude = longitude;
//     _distanceFromUser = distanceFromUser;
//   }
//   // getters
//   String get name => _name;
//   String get address => _address;
//   double get latitude => _latitude;
//   double get longitude => _longitude;
//   double get distanceFromUser => _distanceFromUser;
// }

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Eatery implements Comparable{
  String name;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;
  double distancefromuser;

  Eatery(
      {this.name,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords,
      this.distancefromuser
      });

  @override
  String toString(){
    return '{ ${this.name}, ${this.distancefromuser}';
  }

  int compareTo(other) {

    if (this.distancefromuser == null || other == null) {
      return null;
    }

    if (this.distancefromuser < other.marks) {
      return 1;
    }

    if (this.distancefromuser > other.marks) {
      return -1;
    }

    if (this.distancefromuser == other.marks) {
      return 0;
    }

    return null;
  }

}
