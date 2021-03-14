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
import 'FileReader.dart';
import 'dart:io';
import 'HealthyEateryRecommender.dart';

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
    //_healthyEateriesList = csvToDict('EateryData/HealthyEateries.csv');
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
