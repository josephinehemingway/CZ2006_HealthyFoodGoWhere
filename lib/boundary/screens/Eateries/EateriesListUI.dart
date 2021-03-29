import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/boundary/screens/Home/HomeUI.dart';
import 'package:geolocator/geolocator.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';
import '../../../control/RecommendHealthyEatery.dart';
import 'package:csv/csv.dart' as csv;
import '../../../entity/Eatery.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'googleMapUI.dart';
import 'package:flutter_app/boundary/widgets/customIcons.dart';
import '../../widgets/animation.dart';
import 'package:flutter_app/entity/CurrentUser.dart';
import 'filterRadiusUI.dart';

class HealthyEateriesList extends StatefulWidget {
  static String routeName = '/eateries';
  static List<Eatery> _withinRadiusEateries = [];
  static LatLng currentPosition;
  static Position currentPos;
  @override
  _HealthyEateriesListState createState() => _HealthyEateriesListState();
}

List<Eatery> getEateriesInRadius(){
  return(HealthyEateriesList._withinRadiusEateries);
}

class _HealthyEateriesListState extends State<HealthyEateriesList> {
  CurrentUser user;
  List<List<dynamic>> healthyEats = [];
  List<List<String>> eatery = [];
  var geoLocator = Geolocator();
  List<Eatery> EateryList = [];

  loadAsset() async {
    final myEats =  await rootBundle.loadString('EateryData/HealthyEateriesNew.csv');
    List<List<dynamic>> csvTable = const csv.CsvToListConverter().convert(myEats);
    setState(() {
      healthyEats = csvTable;
    });
    // print(healthyEats[0]);
  }

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
    asyncLoad();
  }

  void asyncLoad() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    HealthyEateriesList.currentPos = position;
    HealthyEateriesList.currentPosition = LatLng(position.latitude, position.longitude);

    await loadAsset();
    createEateryList();
    HealthyEateriesList._withinRadiusEateries = filterEateryByRadius(EateryList,
        HealthyEateriesList.currentPosition.latitude, HealthyEateriesList.currentPosition.longitude, filterRadius.value);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.location_on_rounded),
      backgroundColor: Colors.teal[300],

      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => (GoogleMapScreen())));

      },),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery),
        body: Center(
          child: HealthyEateriesList.currentPosition == null
              ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.teal),
          )
          : nested(),),
  );

  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          eateryAppBar(
              'Healthy Eateries',
              'These nearby eateries are recommended to you based on your dietary preferences, the set location and the radii distance',
              context,
              HomeUI(),
              filterRadius(),
              'images/appbar_eatery.png'),
        ];
      },
      body: new ListView.builder(
              itemCount: HealthyEateriesList._withinRadiusEateries.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation_Y(1, Container(
                    height: 130,
                    child: Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.white,
                        elevation: 2,

                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[ ListTile(
                              leading: Icon(MyFlutterApp.cutlery, color: Colors.teal[100], size: 40),
                              title: Text(HealthyEateriesList._withinRadiusEateries[index].name),
                              subtitle: Text(HealthyEateriesList._withinRadiusEateries[index].address),
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
                                Text(HealthyEateriesList._withinRadiusEateries[index].distancefromuser.toString() + " km", style: TextStyle(fontSize: 18))
                              ],
                            )

                          ])
                )));
              },
            ),
    );
  }
}
