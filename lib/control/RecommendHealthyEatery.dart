import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../entity/Eatery.dart';

/// This is a control class to recommend Healthy Eateries nearby.
class RecommendHealthyEatery {

  /// A method to filter [EateryList] to obtain Eateries that is within the set radius distance from user's current location.
  ///
  /// Returns [Eatery] objects that are within radius.
  /// Takes the parameters:
  /// - [EateryList]: List of all [Eatery] objects obtained from [HealthyEateriesNew.csv]
  /// - [userLatitude] and [userLongitude]: User's current coordinates
  /// - [radiusInKm]: user's set radius distance (1.0 km by default)
  static List<Eatery> filterEateryByRadius(
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

    // Sorts [withinRadiusEateries] in ascending distance from user.
    withinRadiusEateries.sort((a,b) => a.distancefromuser.compareTo(b.distancefromuser));
    print(withinRadiusEateries.toString());

    return withinRadiusEateries;
  }

  /// A method to return distance between a pair of coordinates.
  ///
  /// Returns distance ['double'].
  static double getDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  /// A method to return an error message if the user slides the radius distance to 0.0km.
  ///
  /// Returns a Widget.
  static Widget returnError(distance){
    if (distance == 0){
      return Container(
          width: 300,
          child: Text("Invalid distance chosen, try a larger radius.",
          style: TextStyle(fontSize: 16, color: Colors.red[900]), textAlign: TextAlign.center,
      ));
    }
    else{
      return SizedBox(height: 0,);
    }
  }

}
