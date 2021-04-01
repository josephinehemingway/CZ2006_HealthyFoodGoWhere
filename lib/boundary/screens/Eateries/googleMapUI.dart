import 'package:flutter/material.dart';
import 'EateriesListUI.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/bottomNavBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/entity/CurrentUser.dart';
import '../../../entity/Eatery.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';

/// This is the boundary class which displays the Google Maps in the mobile UI interface.
///
/// Displays the location markers of each Eatery and a scrollable horizontal list of cards
/// consisting of the Eatery's information.
class GoogleMapScreen extends StatefulWidget {

  /// A constructor for the ['GoogleMapScreen'] class.
  const GoogleMapScreen({
    Key key,
    this.coord,
    this.index,
  }) : super(key: key);

  /// The route name for navigation to this page.
  static String routeName = '/map';

  /// The coordinates of the initial camera position in LatLng datatype.
  ///
  /// It is an argument passed from ['EateriesListUI'].
  /// When the user accesses the Google Maps Screen by clicking on the location button
  /// associated with the Eatery he wishes to view, this coordinate will correspond to the
  /// selected Eatery's coordinates.
  ///
  /// However, if the user clicks on the floating location button at the bottom right of the
  /// ['EateryListUI'] screen, this coordinate will correspond to the user's current location.
  final LatLng coord;

  /// Index of the eatery from the Eatery list.
  ///
  /// It is an argument passed from ['EateriesListUI'] when the user clicks on the location
  /// button associated with the Eatery he wishes to view.
  ///
  /// If the user wishes to see all the eateries nearby his location, index = null
  /// when he clicks on the floating location button at the bottom right of the ['EateryListUI'].
  final int index;

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

/// This class manages the state of the GoogleMaps UI.
///
/// Includes the business logic behind GoogleMaps UI.
class _GoogleMapScreenState extends State<GoogleMapScreen> {

  /// Initializes the current user.
  CurrentUser user;

  /// A list of location markers for all the eateries in the list.
  List<Marker> allMarkers = [];

  /// A list of eateriesInRange as Eatery objects.
  List<Eatery> eateriesInRange = getEateriesInRadius(); //.sublist(0,10);

  /// The current user's current position in Latitude and Longitude (LatLng) datatype.
  LatLng currentPosition = HealthyEateriesList.currentPosition;

  /// The current user's current position in Position datatype.
  Position currentPos = HealthyEateriesList.currentPos;

  var geoLocator = Geolocator();
  GoogleMapController _controller;
  PageController _pageController;

  /// The previous page from the current page of the horizontal listview.
  int prevPage;

  /// A method to locate the initial camera position.
  ///
  /// The camera will be centered on the eatery if ['widget.index'] is not null.
  /// Otherwise, the camera will center on the user's current location.
  void locatePos() async {
    CameraPosition cameraPosition;
    if (widget.index != null){
      cameraPosition = new CameraPosition(target: widget.coord, zoom: 17);
    }
    else{
      cameraPosition = new CameraPosition(target: widget.coord, zoom: 15);
    }
    _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  /// Initialising what is needed to be run upon reaching this page.
  void initState() {
    // TODO: implement initState
    super.initState();
    locatePos();

    /// A for loop that iterates the ['eateriesInRange'] list to create location markers for each eatery.
    ///
    /// Each location marker created is to be added into the ['allMarkers'] list of markers.
    /// Each marker is to be displayed on the Google Maps Screen.
    ///
    /// Upon clicking the location marker, user will be able to see the name and address of the eatery,
    /// and the horizontal list will animate to show the current eatery clicked.
    for (int i = 0; i<eateriesInRange.length; i++){
      Eatery element = eateriesInRange[i];

      allMarkers.add(Marker(
          markerId: MarkerId(i.toString()),
          draggable: false,
          infoWindow:
          InfoWindow(title: element.name, snippet: element.address),
          position: element.locationCoords,
          onTap: () {
            _pageController.animateToPage(i, curve: Curves.easeIn,
              duration: Duration(seconds: 1),);
          }
      ));
    }

    /// A condition to control the initial page of the horizontal list when the user navigates to the Google Maps Screen.
    ///
    /// If index is not null, the initial page of the horizontal list will show the Eatery that the user has clicked on
    /// from the ['EateriesListUI'] screen.
    /// If null, the initial page of the horizontal list will show the nearest eatery to the user's current location.
    if (widget.index != null){
      _pageController = PageController(initialPage: widget.index, viewportFraction: 0.8)
        ..addListener(_onScroll);
    }
    else{
      _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
        ..addListener(_onScroll);
    }
  }

  /// A method to set the state of the map upon creation of the Google Map widget.
  void mapCreated(controller) {
    setState(() {
      _controller = controller;
      locatePos();
    });
  }

  /// The build method of the Google Maps Screen UI.
  ///
  /// The following settings are enabled for the Google Maps widget.
  /// - myLocationButton
  /// - myLocation
  /// - zoomGestures
  /// - zoomControls
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('Google Maps', context, HealthyEateriesList()),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,

              child: GoogleMap(
                padding: EdgeInsets.only(bottom: 130,),
                initialCameraPosition:
                CameraPosition(target: widget.coord,
                  zoom: 10.0,),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,

              ),
            ),

            Positioned(
              bottom: 0.0,
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: eateriesInRange.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _healthyEateriesList(index);
                  },
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery));
  }

  /// A method to navigate the pages of the horizontal list via Scrolling.
  ///
  /// As the user scrolls the horizontal list, the camera is animated to center on the
  /// corresponding eatery marker on the Map.
  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  /// A method to update the camera position according to the currently
  /// selected Eateries' coordinates.
  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: eateriesInRange[_pageController.page.toInt()].locationCoords,
        zoom: 17.0,
        bearing: 5.0,
        tilt: 10.0)));
  }

  /// The creation of the horizontal list to display the Eateries' information.
  ///
  /// The eatery's name, address and distance from user's current location will be displayed.
  /// Uses an animated builder to create animated transitions as the user scrolls the list.
  _healthyEateriesList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 0,
                    ),
                    height: 155.0,
                    width: 310.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row( children: [
                          Container(
                              height: 125.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          eateriesInRange[index].thumbNail),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 10.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 180.0,
                                  child: Text(eateriesInRange[index].name,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 0),
                                Container(
                                  width: 180.0,
                                  child: Text(eateriesInRange[index].distancefromuser.toString() + ' km',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  width: 180.0,
                                  child: Text(eateriesInRange[index].address,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                        ])]))))
          ])),
    );
  }


}

