import 'dart:io';
import 'package:csv/csv.dart' as csv;
import 'HealthyEateryRecommender.dart';

// void main() {
//   double radiusInKm = 3;
//   List<Map<String, dynamic>> healthyEateryList =
//       csvToDict('EateryData/HealthyEateries.csv');
//   List<Map<String, dynamic>> withinRadiusEateries = filterEateryByRadius(
//       healthyEateryList, 1.3527401672849244, 103.69683848785874, radiusInKm);
//   List<Map<String, dynamic>> sampledEateries =
//       sampleEateries(healthyEateryList, max: 6);
//   print(sampledEateries);
// }

// returns all eateries in csv file - list of dict
List<Map<String, dynamic>> csvToDict(String filePath) {
  File csvFile = new File(filePath); // 'EateryData/HealthyEateries.csv'
  csv.CsvToListConverter c = new csv.CsvToListConverter(
      eol: '\r\n', fieldDelimiter: ",", shouldParseNumbers: true);
  List<List<dynamic>> eateriesList = c.convert(csvFile.readAsStringSync());
  List<Map<String, dynamic>> eateriesListOfDict = [];
  for (List<dynamic> healthyEatery in eateriesList) {
    eateriesListOfDict.add({
      'name': healthyEatery[0],
      'address': healthyEatery[1],
      'latitude': healthyEatery[2],
      'longitude': healthyEatery[3],
      'distanceFromUser': null
    });
  }
  return eateriesListOfDict.sublist(1, eateriesListOfDict.length);
}
