import 'package:flutter/material.dart';
import 'package:flutter_app/boundary/screens/Eateries/EateriesListUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';

/// This is the boundary class which displays a [Slider] UI to allow users to adjust the radius range of the nearby eateries.
class filterRadius extends StatefulWidget {

  /// The route name for navigation to [filterRadius].
  static String routeName = '/filter';

  @override
  _filterRadiusState createState() => _filterRadiusState();
}

/// This class manages the state of the [filterRadius] UI.
///
/// Includes the business logic behind [filterRadius] UI.
class _filterRadiusState extends State<filterRadius> {

  /// The current slider value.
  double _currentSliderValue = HealthyEateriesList.radiusDistance;

  /// The building of the [filterRadius] widget page.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Initialising [myAppBar] for this page.
      appBar: myAppBar("Filter Eateries", context, HealthyEateriesList()),
      resizeToAvoidBottomInset: false,

      // Initialising [BottomNavBar] for this page.
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              width: 350,
              child: Text("Edit the radius to filter nearby healthy eateries within this radius.",
                style: TextStyle(fontSize: 20, color: Colors.grey[700]), textAlign: TextAlign.center,
            )),
            SizedBox(height: 20,),

            // This is the slider widget for the users to adjust the radius in km.
            Slider(
                value: _currentSliderValue,
                activeColor: Colors.teal[300],
                inactiveColor: Colors.teal[100],
                min: 0,
                max: 5,
                divisions: 20,
                label: _currentSliderValue.toString(),
                onChanged: (value) {
                  setState(() {
                  _currentSliderValue = value;
                  HealthyEateriesList.radiusDistance = _currentSliderValue;
                  });
                }
          ),
            SizedBox(height: 15,),
            Container(
                width: 300,
                child: Text("Filter eateries within ${_currentSliderValue} km from my current location.",
                  style: TextStyle(fontSize: 18, color: Colors.grey[500]), textAlign: TextAlign.center,
                )),
          ])),
      );
  }
}
