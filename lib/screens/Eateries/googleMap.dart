import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Eateries/EateriesListPage.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import 'package:flutter_app/widgets/bottomNavBar.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('GoogleMaps', context, HealthyEateries()),
      body:
        GoogleMap(initialCameraPosition: CameraPosition(
          target: LatLng(1.3476951854010337, 103.688100402735),
          zoom: 15,
        ),),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery));
  }
}
