import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Home/HomeUI.dart';
import 'package:geolocator/geolocator.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';
import 'RecommendHealthyEatery.dart';
import 'package:csv/csv.dart' as csv;
import 'dart:convert';
import 'Eatery.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'googleMapUI.dart';
import 'package:flutter_app/widgets/customIcons.dart';

class HealthyEateries extends StatefulWidget {
  static String routeName = '/eateries';
  static List<Eatery> _withinRadiusEateries = [];
  @override
  _HealthyEateriesState createState() => _HealthyEateriesState();
}

List<Eatery> getEateriesInRadius(){
  return(HealthyEateries._withinRadiusEateries);
}

class _HealthyEateriesState extends State<HealthyEateries> {
  List<List<dynamic>> healthyEats = [];
  List<List<String>> eatery = [];

  loadAsset() async {
    final myEats =  await rootBundle.loadString('EateryData/HealthyEateriesNew.csv');
    List<List<dynamic>> csvTable = const csv.CsvToListConverter().convert(myEats);
    setState(() {
      healthyEats = csvTable;
    });
    // print(healthyEats[0]);
  }

  List<Eatery> EateryList = [];
  createEateryList(){
      for (int i=1; i<healthyEats.length; i++) {
        int j = 0;
        Eatery eateryobj = Eatery(
            name: healthyEats[i][j].toString(),
            address: healthyEats[i][j + 1].toString(),
            description: null,
            thumbNail: "https://d1sag4ddilekf6.cloudfront.net/compressed/merchants/4-CZJTRFUVVYMBR6/hero/eef5b5223b4e47fe826903cc14131ae1_1591598479662885781.jpeg",
            locationCoords: LatLng(
                double.parse(healthyEats[i][j + 2].toString()), double.parse(healthyEats[i][j + 3].toString()))
        );
        EateryList.add(eateryobj);
      }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.location_on_rounded),
      backgroundColor: Colors.teal[300],

      onPressed: () async{
        await loadAsset();
        createEateryList();
        HealthyEateries._withinRadiusEateries = filterEateryByRadius(EateryList, 1.344449690791518, 103.68036711260291, 1.5);

        Navigator.push(context, MaterialPageRoute(builder: (context) => (GoogleMapScreen())));

      },),
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
      body: new ListView.builder(
              itemCount: HealthyEateries._withinRadiusEateries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 130,
                    child: Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.white,
                        elevation: 2,

                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[ListTile(

                          leading: Icon(MyFlutterApp.cutlery, color: Colors.teal[100], size: 40),
                          title: Text(HealthyEateries._withinRadiusEateries[index].name),
                          subtitle: Text(HealthyEateries._withinRadiusEateries[index].address),
                          trailing:
                            IconButton(
                              icon: Icon(Icons.location_on_rounded, color: Colors.teal[200], size:40),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => (GoogleMapScreen())));
                              },
                            ),
                          ),

                            Row(
                              children: <Widget>[
                                SizedBox(width: 72,),
                                Text(HealthyEateries._withinRadiusEateries[index].distancefromuser.toString() + " km", style: TextStyle(fontSize: 18))
                              ],
                            )

                          ])
                ));
              },
            ),
    );
  }

  // Future<void> _loadCSV(String filePath) async {
  //   final _rawData = await rootBundle.loadString(filePath);
  //   csv.CsvToListConverter c = new csv.CsvToListConverter(
  //       eol: '\r\n', fieldDelimiter: ",", shouldParseNumbers: true);
  //   List<List<dynamic>> eateriesList = c.convert(_rawData);
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
  //   setState(() {
  //     _healthyEateriesList = eateriesListOfDict;
  //   });
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
