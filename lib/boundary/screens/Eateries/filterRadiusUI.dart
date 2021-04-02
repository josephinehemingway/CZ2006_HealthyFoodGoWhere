import 'package:flutter/material.dart';
import 'package:flutter_app/boundary/screens/Eateries/EateriesListUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';

/// This is the filterRadius UI to allow users to adjust the radius of the nearby eateries.
///
/// Consists of the radius slider.
class filterRadius extends StatefulWidget {

  /// The route name for navigation to this page.
  static String routeName = '/filter';

  // static double value;
  @override
  _filterRadiusState createState() => _filterRadiusState();
}

class _filterRadiusState extends State<filterRadius> {
  double _currentSliderValue = HealthyEateriesList.radiusDistance;

  /// The building of the filterRadius widget page.
  ///
  /// Returns a scaffold of the screen.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /// Initialising a custom app bar for this page.
      appBar: myAppBar("Filter Eateries", context, HealthyEateriesList()),
      resizeToAvoidBottomInset: false,

      /// Initialising a custom bottom navigation bar for this page.
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

            /// This is the slider widget for the users to adjust the radius in km.
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
