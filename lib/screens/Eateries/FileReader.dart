import 'dart:io';
import 'package:csv/csv.dart' as csv;

// void main() async {
//   File csvFile = new File('HealthyEateries.csv');
//   List<List<dynamic>> healthyEateriesList = csvToList(csvFile);
//   var radiusInKm = 3;
//   List<List<dynamic>> withinRadiusEateries;
//   for (List healthyEatery in healthyEateriesList) {}
// }

List<List<dynamic>> csvToList(File csvFile) {
  csv.CsvToListConverter c = new csv.CsvToListConverter(
      eol: '\r\n', fieldDelimiter: ",", shouldParseNumbers: true);
  return c.convert(csvFile.readAsStringSync());
}
