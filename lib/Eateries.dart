import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/HomePage.dart';
import 'animation.dart';
import 'package:flutter_app/my_flutter_app_icons.dart';

class HealthyEateries extends StatefulWidget {
  @override
  _HealthyEateriesState createState() => _HealthyEateriesState();
}

class _HealthyEateriesState extends State<HealthyEateries> {
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.white,

    appBar: AppBar(
      title: Text('Healthy Eateries'),
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.blueGrey,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
      ),
    ),
  );
}
