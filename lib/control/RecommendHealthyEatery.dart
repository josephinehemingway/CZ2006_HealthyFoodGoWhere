import 'dart:math';
import '../entity/Eatery.dart';

/// A list of [Eatery] objects that are within set radius from user's current location.
List<Eatery> withinRadiusEateries;

/// Distance between Eatery and user.
double distanceFromUser;

/// A method to filter [EateryList] to obtain Eateries that is within the set radius distance from user's current location.
///
/// Returns [Eatery] objects that are within radius.
/// Takes the parameters:
/// - [EateryList]: List of all [Eatery] objects obtained from [HealthyEateriesNew.csv]
/// - [userLatitude] and [userLongitude]: User's current coordinates
/// - [radiusInKm]: user's set radius distance (1.0 km by default)
List<Eatery> filterEateryByRadius(
    List<Eatery> EateryList,
    double userLatitude,
    double userLongitude,
    double radiusInKm) {

  withinRadiusEateries = [];

  for (Eatery healthyEatery in EateryList) {

    distanceFromUser = getDistance(healthyEatery.locationCoords.latitude, healthyEatery.locationCoords.longitude, userLatitude, userLongitude);
    distanceFromUser = (distanceFromUser * 10).round() / 10;

    healthyEatery.distancefromuser = distanceFromUser;

    if (distanceFromUser <= radiusInKm) {
      withinRadiusEateries.add(healthyEatery);
    }
  }

  /// A method to sort [withinRadiusEateries] in ascending distance from user.
  withinRadiusEateries.sort((a,b) => a.distancefromuser.compareTo(b.distancefromuser));
  print(withinRadiusEateries.toString());

  return withinRadiusEateries;
}

/// A method to return distance between a pair of coordinates.
///
/// Returns distance ['double'].
double getDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
