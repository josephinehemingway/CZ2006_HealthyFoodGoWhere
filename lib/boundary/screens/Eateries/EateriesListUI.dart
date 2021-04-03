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
import 'package:flutter_app/boundary/widgets/animation.dart';

/// This is the boundary class which displays the List of Healthy Eateries in the mobile UI.
class HealthyEateriesList extends StatefulWidget {

  /// The route name for navigation to [HealthyEateriesList].
  static String routeName = '/eateries';

  /// The list of within radius Healthy Eateries to be displayed on the page.
  ///
  /// As it is a private variable, a getter is required.
  static List<Eatery> _withinRadiusEateries = [];

  /// The current user's current position in Latitude and Longitude ([LatLng]) datatype.
  static LatLng currentPosition;

  /// The current user's current position in [Position] datatype.
  static Position currentPos;

  /// The user's set radius distance.
  ///
  /// By default, [radiusDistance] is set to 1.0 km.
  /// It will update when users adjust the radius distance in [filterRadius].
  static double radiusDistance = 1.0;

  @override
  _HealthyEateriesListState createState() => _HealthyEateriesListState();
}

/// This is the getter for [HealthyEateriesList._withinRadiusEateries].
///
/// Returns Eateries that are in range from the user's current position.
List<Eatery> getEateriesInRadius(){
  return(HealthyEateriesList._withinRadiusEateries);
}

/// This class manages the state of the [HealthyEateriesList] UI.
///
/// Includes the business logic behind [HealthyEateriesList] UI.
class _HealthyEateriesListState extends State<HealthyEateriesList> {

  /// Initializing [CurrentUser].
  CurrentUser user;

  /// Initializing a nested list of [dynamic] elements to store the Eateries' data which is obtained from [HealthyEateriesNew.csv] file.
  List<List<dynamic>> healthyEats = [];

  /// Initializing a nested list of [String] elements to store the Eateries' data as [String].
  List<List<String>> eatery = [];

  /// Initializing a list of [Eatery] objects to store the Eateries' data.
  List<Eatery> EateryList = [];

  /// A tool to locate the user's current position.
  var geoLocator = Geolocator();


  /// A method to load the Eateries' data from [HealthyEateriesNew.csv].
  ///
  /// First obtains the data as a [String],
  /// which is then converted into a nested list of [dynamic] elements.
  loadAsset() async {
    final myEats =  await rootBundle.loadString('EateryData/HealthyEateriesNew.csv');
    List<List<dynamic>> csvTable = const csv.CsvToListConverter().convert(myEats);

    // Notify the framework that the internal state of this object has changed.
    //
    // Passes the nested list of dynamic elements [csvTable] into [healthyEats] nested list.
    setState(() {
      healthyEats = csvTable;
    });
  }

  /// A method defined to create a list of [Eatery] objects [EateryList].
  ///
  /// Reads [healthyEats] list and convert its elements into instances of
  /// [Eatery] objects to be added into [EateryList].
  createEateryList(){
      for (int i=1; i<healthyEats.length; i++) {
        int j = 0;
        Eatery eateryobj = Eatery(
            name: healthyEats[i][j].toString(),
            address: healthyEats[i][j + 1].toString(),
            description: null,
            thumbNail: healthyEats[i][j + 4].toString(),
            locationCoords: LatLng(
                double.parse(healthyEats[i][j + 2].toString()), double.parse(healthyEats[i][j + 3].toString()))
        );
        EateryList.add(eateryobj);
      }
  }

  /// A method defined to load the necessary data for our [HealthyEateryList] UI.
  ///
  /// Calls:
  /// - [Geolocator] to get the user's current position,
  /// - [loadAsset] method to load the Eateries' data from the csv file,
  /// - [createEateryList] method to create the list of Eatery objects, and
  /// - [filterEateryByRadius] method to filter the list of eateries to retrieve
  /// eateries that are within the radius range from the user's current position.
  void asyncLoad() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    HealthyEateriesList.currentPos = position;
    HealthyEateriesList.currentPosition = LatLng(position.latitude, position.longitude);

    await loadAsset();
    createEateryList();
    HealthyEateriesList._withinRadiusEateries = filterEateryByRadius(EateryList,
        HealthyEateriesList.currentPosition.latitude, HealthyEateriesList.currentPosition.longitude, HealthyEateriesList.radiusDistance);
  }

  /// A method that initializes the state of the UI.
  ///
  /// Calls the function [asyncLoad] to initialize the data required.
  @override
  void initState() {
    super.initState();
    asyncLoad();
  }

  /// Widget Build method to implement [HealthyEateryList] UI.
  @override
  Widget build(BuildContext context) => Scaffold(

    // An action button that allows user to navigate to the Google Maps Page.
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_on_rounded),
        backgroundColor: Colors.teal[300],

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => (GoogleMapScreen(coord: HealthyEateriesList.currentPosition))));
        },),

          resizeToAvoidBottomInset: false,
          bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery),

    // Creating the body of the widget.
    //
    // Returns a circular progress indicator when the user's current position is
    // still being obtained by Geolocator, in which [HealthyEateriesList.currentPosition] will return null.
    // Otherwise, it will return [nested()] widget.
        body: Center(
          child: HealthyEateriesList.currentPosition == null
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40,),
                  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.teal),),
                  SizedBox(height: 20,),
                  Text("Loading nearby eateries around you...", style: TextStyle(color: Colors.grey[500], fontSize: 16),)
                ])
          : nested(),),
  );


  /// A widget that returns a [NestedScrollView] that contains a scrollable listview for the eatery list.
  nested() {
    return NestedScrollView(

      // Initializing a custom sliver AppBar [eateryAppBar] for the page.
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          eateryAppBar(
              'Healthy Eateries Nearby',
              'These nearby eateries recommended to you are within the radius distance set from your current location.',
              context,
              HomeUI(),
              filterRadius(),
              'images/appbar_eatery.png',
              '* Data from Health Promotion Board'),
        ];
      },

      // Initializing a [ListView.builder] to generate the list of nearby Eateries
      // within the set radius.
      body: HealthyEateriesList._withinRadiusEateries.isNotEmpty ? new ListView.builder(
              itemCount: HealthyEateriesList._withinRadiusEateries.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(1, Container(
                    height: 130,
                    child: Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.white,
                        elevation: 2,

                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: <Widget>[
                            // Creating a [ListTile] for each eatery in the list.
                            //
                            // Each ListTile will display the title, location and distance from user for each Eatery.
                            ListTile(
                              leading: Icon(MyFlutterApp.cutlery, color: Colors.teal[100], size: 40),
                              title: Text(HealthyEateriesList._withinRadiusEateries[index].name),
                              subtitle: Text(HealthyEateriesList._withinRadiusEateries[index].address),
                              trailing:

                              /// An Icon button that allows users to click to navigate to the Eatery location on the Map Screen.
                              IconButton(
                                icon: Icon(Icons.location_on_rounded, color: Colors.teal[200], size:40),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => (GoogleMapScreen(coord: HealthyEateriesList._withinRadiusEateries[index].locationCoords, index: index))));
                                  print(HealthyEateriesList._withinRadiusEateries[index].locationCoords);
                                  print(index);
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
      ) : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),

            // Exception Handling if [HealthyEateriesList._withinRadiusEateries] is empty.
            Container(
                width: 350,
                child: Text("No nearby eateries found \nwithin ${HealthyEateriesList.radiusDistance} km of your current location.",
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                  textAlign: TextAlign.center,)
            ),
            SizedBox(height: 10,),
            Text("Try a larger radius distance.", style: TextStyle(color: Colors.grey[600], fontSize: 16),)
          ]),
    );
  }
}
