class Eatery {
  String _name;
  String _address;
  double _latitude;
  double _longitude;
  double _distanceFromUser;
  Eatery(
      {String name,
      String address,
      double latitude,
      double longitude,
      double distanceFromUser}) {
    _name = name;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _distanceFromUser = distanceFromUser;
  }
  // getters
  String get name => _name;
  String get address => _address;
  double get latitude => _latitude;
  double get longitude => _longitude;
  double get distanceFromUser => _distanceFromUser;
}
