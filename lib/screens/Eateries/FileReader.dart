// import 'dart:io';
// import 'package:csv/csv.dart' as csv;
// import 'package:flutter/services.dart';
// import 'Eatery.dart';
// import 'HealthyEateryRecommender.dart';
// void main() {
//   double radiusInKm = 3;
//   List<Map<String, dynamic>> healthyEateryList = // contains all eateries
//       csvToDict('EateryData/HealthyEateries.csv');
//   List<Map<String, dynamic>> withinRadiusEateries = filterEateryByRadius(
//       // contains eateries within radius
//       healthyEateryList,
//       1.3527401672849244,
//       103.69683848785874,
//       radiusInKm);
//   List<Eatery> sampledEateries =
//       sampleEateries(withinRadiusEateries, max: 6); // a subset of eateries
//   print(sampledEateries[0].distanceFromUser.toString()); // using getters
// }

// returns all eateries in csv file - list of dict
// List<Map<String, dynamic>> csvToDict(String filePath) async {
//   final _rawData = await rootBundle.loadString(filePath);
//   csv.CsvToListConverter c = new csv.CsvToListConverter(
//       eol: '\r\n', fieldDelimiter: ",", shouldParseNumbers: true);
//   List<List<dynamic>> eateriesList = c.convert(csvFile.readAsStringSync());
//   List<Map<String, dynamic>> eateriesListOfDict = [];
//   for (List<dynamic> healthyEatery in eateriesList) {
//     eateriesListOfDict.add({
//       'name': healthyEatery[0],
//       'address': healthyEatery[1],
//       'latitude': healthyEatery[2],
//       'longitude': healthyEatery[3],
//       'distanceFromUser': null
//     });
//   }
//   return eateriesListOfDict.sublist(1, eateriesListOfDict.length);
// }
