import 'package:flutter/material.dart';
import 'EateriesListUI.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/bottomNavBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/entity/CurrentUser.dart';
import '../../../entity/Eatery.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({
    Key key,
    this.coord,
    this.index,
  }) : super(key: key);

  static String routeName = '/map';
  final LatLng coord;
  final int index;

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  CurrentUser user;
  List<Marker> allMarkers = [];
  List<Eatery> eateriesInRange = getEateriesInRadius(); //.sublist(0,10);

  LatLng currentPosition = HealthyEateriesList.currentPosition;
  Position currentPos = HealthyEateriesList.currentPos;
  GoogleMapController _controller;
  PageController _pageController;
  int prevPage;
  var geoLocator = Geolocator();

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

  void initState() {
    // TODO: implement initState
    super.initState();
    locatePos();

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

    if (widget.index != null){
      _pageController = PageController(initialPage: widget.index, viewportFraction: 0.8)
        ..addListener(_onScroll);
    }
    else{
      _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
        ..addListener(_onScroll);
    }

    // print(eateriesInRange.length);
    // print("markers: " + allMarkers.toString());

  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
      locatePos();
    });
  }

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
                // markers: _markers,
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

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: eateriesInRange[_pageController.page.toInt()].locationCoords,
        zoom: 17.0,
        bearing: 5.0,
        tilt: 10.0)));
  }

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

