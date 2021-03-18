import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Eateries/googleMap.dart';
import 'package:flutter_app/screens/Home/HomeMenu.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/my_flutter_app_icons.dart';
import 'Eatery.dart';
import 'HealthyEateryRecommender.dart';
import 'package:csv/csv.dart' as csv;

class HealthyEateries extends StatefulWidget {
  static String routeName = '/eateries';
  @override
  _HealthyEateriesState createState() => _HealthyEateriesState();
}

class _HealthyEateriesState extends State<HealthyEateries> {
  List healthyEateriesList = [];
  @override
  void initState() {
    super.initState();
    _loadJSON();
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
              'These nearby eateries are recommended to you based on your dietary preferences, the set location and the radii distance',
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

  Future<void> _loadJSON() async {
    final String response =
        await rootBundle.loadString("assets/HealthyEateries.json");
    final data = await json.decode(response);
    setState(() {
      healthyEateriesList = data["eateries"];
    });
  }

  // Future<List<Eatery>> _loadJSON(String filePath) async {
  //   String data = await DefaultAssetBundle.of(context)
  //       .loadString("assets/HealthyEateries.json");
  //   final jsonResult = json.decode(data);
  //   List<Eatery> eateryList = [];
  //   for (var healthyEatery in jsonResult) {
  //     eateryList.add(Eatery.fromJson(healthyEatery));
  //   }
  //   return eateryList;
  // }
  //
  // Future<List<Eatery>> _loadCSV(String filePath) async {
  //   final _rawData = await rootBundle.loadString(filePath);
  //   csv.CsvToListConverter c = new csv.CsvToListConverter(
  //       eol: '\r\n', fieldDelimiter: ",", shouldParseNumbers: true);
  //   List<List<dynamic>> eateriesList = c.convert(_rawData);
  //   List<Eatery> eateryList = [];
  //   for (List<dynamic> healthyEatery in eateriesList) {
  //     eateryList.add(Eatery(
  //         name: healthyEatery[0],
  //         address: healthyEatery[1],
  //         description: null,
  //         thumbNail: null,
  //         locationCoords: LatLng(healthyEatery[2], healthyEatery[3]),
  //         distanceFromUser: null));
  //   }
  //   return eateryList;
  // }

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
