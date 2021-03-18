import 'package:flutter/services.dart';
import 'package:csv/csv.dart' as csv;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Eatery.dart';

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
