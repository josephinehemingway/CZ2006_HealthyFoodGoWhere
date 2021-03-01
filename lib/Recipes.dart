import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/HomePage.dart';
import 'animation.dart';
import 'package:flutter_app/my_flutter_app_icons.dart';

class HealthyRecipes extends StatefulWidget {
  @override
  _HealthyRecipesState createState() => _HealthyRecipesState();
}

class _HealthyRecipesState extends State<HealthyRecipes> {
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.white,

    appBar: AppBar(
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
