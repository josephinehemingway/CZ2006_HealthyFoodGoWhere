import 'package:flutter/material.dart';
import 'package:flutter_app/boundary/screens/Eateries/EateriesListUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/customAppBar.dart';


class filterRadius extends StatefulWidget {
  static String routeName = '/filter';
  // static double value;
  @override
  _filterRadiusState createState() => _filterRadiusState();
}

class _filterRadiusState extends State<filterRadius> {
  double _currentSliderValue = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Filter Eateries", context, HealthyEateriesList()),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350,
              child: Text("Edit the radius to filter nearby healthy eateries within this radius.", style: TextStyle(fontSize: 20, color: Colors.grey[500]), textAlign: TextAlign.center,
            )),
            SizedBox(height: 20,),
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
                  });
                }
          )])),
      );
  }
}
