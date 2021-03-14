import 'dart:math';

// returns eateries within radius - list of Dict
List<Map<String, dynamic>> filterEateryByRadius(
    List<Map<String, dynamic>> healthyEateriesList,
    double userLatitude,
    double userLongitude,
    double radiusInKm) {
  List<Map<String, dynamic>> withinRadiusEateries = [];

  for (Map<String, dynamic> healthyEatery in healthyEateriesList) {
    double distanceFromUser = getDistance(healthyEatery['latitude'],
        healthyEatery['longitude'], userLatitude, userLongitude);
    healthyEatery['distanceFromUser'] = distanceFromUser;
    if (distanceFromUser <= radiusInKm) {
      withinRadiusEateries.add(healthyEatery);
    }
  }
  return withinRadiusEateries;
}

// returns a sample of 5 eateries (because there may be a lot) - list of Dict
List<Map<String, dynamic>> sampleEateries(
    // returns random list of eateries (default max = 5)
    List<Map<String, dynamic>> healthyEateriesList,
    {int max = 5}) {
  healthyEateriesList..shuffle();
  if (max > healthyEateriesList.length) {
    return healthyEateriesList.sublist(0, healthyEateriesList.length);
  }
  return healthyEateriesList.sublist(0, max);
}

// return distance between the coordinates
double getDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
