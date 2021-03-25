import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Eateries/EateriesListPage.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import 'package:flutter_app/widgets/bottomNavBar.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async' show Future;
import 'Eatery.dart';
import 'EateriesListPage.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  List<Marker> allMarkers = [];
  List<Eatery> eateriesInRange = getEateriesInRadius().sublist(5,11);

  PageController _pageController;
  int prevPage;
  GoogleMapController _controller;


  void initState() {
    // TODO: implement initState
    super.initState();

    eateriesInRange.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.name),
          draggable: false,
          infoWindow:
          InfoWindow(title: element.name, snippet: element.address),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
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
                      vertical: 10.0,
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
                        child: Row(children: [
                          Container(
                              height: 105.0,
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
                                SizedBox(height: 10.0),
                                // Text(
                                //   eateriesInRange[index].address,
                                //   style: TextStyle(
                                //       fontSize: 12.0,
                                //       fontWeight: FontWeight.w300),
                                // ),
                                Container(
                                  width: 180.0,
                                  child: Text(eateriesInRange[index].address,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                        ])]))))
          ])),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: eateriesInRange[_pageController.page.toInt()].locationCoords,
        zoom: 18.0,
        bearing: 45.0,
        tilt: 10.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('GoogleMaps', context, HealthyEateries()),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                padding: EdgeInsets.only(bottom: 130,),
                initialCameraPosition:
                CameraPosition(target:
                LatLng(1.3476951854010337, 103.688100402735), zoom: 15,),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
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


}

