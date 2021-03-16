import 'dart:math';
import 'Eatery.dart';

// returns eateries within radius AND updates distanceFromUser attribute
// input: list of dict
// output: list of dict
List<Map<String, dynamic>> filterEateryByRadius(
    List<Map<String, dynamic>> healthyEateriesList,
    double userLatitude,
    double userLongitude,
    double radiusInKm) {
  List<Map<String, dynamic>> withinRadiusEateries = [];

  for (Map<String, dynamic> healthyEatery in healthyEateriesList) {
    double distanceFromUser = getDistance(healthyEatery['latitude'],
        healthyEatery['longitude'], userLatitude, userLongitude);
    distanceFromUser = (distanceFromUser * 10).round() / 10;
    healthyEatery['distanceFromUser'] = distanceFromUser;
    if (distanceFromUser <= radiusInKm) {
      withinRadiusEateries.add(healthyEatery);
    }
  }
  return withinRadiusEateries;
}

// returns a sample of 5 eateries
// input: list of dict
// output: list of Eatery
List<Eatery> sampleEateries(List<Map<String, dynamic>> healthyEateriesList,
    {int max = 5}) {
  List<Eatery> sampleEateries = [];
  healthyEateriesList..shuffle();
  if (max > healthyEateriesList.length) max = healthyEateriesList.length;
  for (Map<String, dynamic> E in healthyEateriesList.sublist(0, max)) {
    sampleEateries.add(Eatery(
        name: E['name'],
        address: E['address'],
        latitude: E['latitude'],
        longitude: E['longitude'],
        distanceFromUser: E['distanceFromUser']));
  }
  return sampleEateries;
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
