import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Eatery.dart';

// returns eateries within radius AND updates distanceFromUser attribute
List<Eatery> filterEateryByRadius(
    List<Eatery> EateryList,
    double userLatitude,
    double userLongitude,
    double radiusInKm) {

  List<Eatery> withinRadiusEateries = [];

  for (Eatery healthyEatery in EateryList) {
    double distanceFromUser = getDistance(healthyEatery.locationCoords.latitude, healthyEatery.locationCoords.longitude, userLatitude, userLongitude);

    distanceFromUser = (distanceFromUser * 10).round() / 10;
    healthyEatery.distancefromuser = distanceFromUser;

    if (distanceFromUser <= radiusInKm) {
      withinRadiusEateries.add(healthyEatery);
    }
  }

  withinRadiusEateries.sort((a,b) => a.distancefromuser.compareTo(b.distancefromuser));
  print(withinRadiusEateries.toString());

  return withinRadiusEateries;
}

// return distance between the coordinates
// output: double
double getDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
