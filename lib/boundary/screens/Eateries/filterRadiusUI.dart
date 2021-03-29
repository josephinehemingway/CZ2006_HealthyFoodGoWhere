import 'package:flutter/material.dart';
import 'package:flutter_app/boundary/screens/Eateries/EateriesListUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';


class filterRadius extends StatefulWidget {
  static String routeName = '/filter';
  static double value;
  @override
  _filterRadiusState createState() => _filterRadiusState();
}

class _filterRadiusState extends State<filterRadius> {
  double _currentSliderValue = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Filter Radius", context, HealthyEateriesList()),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery),
      body: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 5,
        divisions: 20,
        label: _currentSliderValue.toString(),
        onChanged: (value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      )
    );


  }
}
