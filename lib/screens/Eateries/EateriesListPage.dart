import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Eateries/googleMap.dart';
import 'package:flutter_app/screens/Home/HomeMenu.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import 'package:geolocator/geolocator.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/my_flutter_app_icons.dart';
import 'HealthyEateryRecommender.dart';
import 'package:csv/csv.dart' as csv;

class HealthyEateries extends StatefulWidget {
  static String routeName = '/eateries';
  @override
  _HealthyEateriesState createState() => _HealthyEateriesState();
}

class _HealthyEateriesState extends State<HealthyEateries> {
  List<Map<String, dynamic>> _healthyEateriesList;
  List<Map<String, dynamic>> _withinRadiusEateries;

  @override
  void initState() {
    super.initState();
    _loadCSV('EateryData/HealthyEateries.csv');
    _withinRadiusEateries = filterEateryByRadius(
        _healthyEateriesList, 1.3527401672849244, 103.69683848785874, 3);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery),
        body: nested(),
      );

  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          collapsibleAppBar(
              'Healthy Eateries',
              //'These nearby eateries are recommended to you based on your dietary preferences, the set location and the radii distance',
              _healthyEateriesList[0][0],
              context,
              HomePage(),
              'images/appbar_eatery.png'),
        ];
      },
      body: Center(
        child: HomeMenu(
            title: "GoogleMaps",
            subtitle: "healthy eateries nearby",
            NextPg: GoogleMapScreen(),
            customIcon: Icon(Icons.location_on_rounded)),
      ),
    );
  }

  Future<void> _loadCSV(String filePath) async {
    final _rawData = await rootBundle.loadString(filePath);
    csv.CsvToListConverter c = new csv.CsvToListConverter(
        eol: '\r\n', fieldDelimiter: ",", shouldParseNumbers: true);
    List<List<dynamic>> eateriesList = c.convert(_rawData);
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
    setState(() {
      _healthyEateriesList = eateriesListOfDict;
    });
  }

// void setRadiusInKm(double radius) {
  //   // radius setter
  //   this._radiusInKm = radius;
  // }
  //
  // getUserLocation() async {
  //   final coordinates = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best);
  //   print(coordinates);
  //   setState(() {
  //     _userLatitude = coordinates.latitude;
  //     _userLongitude = coordinates.longitude;
  //   });
  // }
}
