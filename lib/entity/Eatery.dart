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
