import 'package:geolocator/geolocator.dart';

double getDistance(double lat1, double long1, double lat2, double long2) {
  double distanceInMeters =
      Geolocator.distanceBetween(lat1, long1, lat2, long2);
  return ((distanceInMeters / 1000 * 10).round().toDouble() / 10);
}

Future<Position> getUserLocation() async {
  Position coordinates = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  return coordinates;
  // setState(() {
  //   userLatitude = coordinates.latitude;
  //   userLongitude = coordinates.longitude;
  // });
}
