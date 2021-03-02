import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/widgets/bottomNavBar.dart';
import 'animation.dart';
import 'screens/Home/HomePage.dart';
import 'screens/Login/LoginPage.dart';


void main() => runApp(
  MaterialApp(
    title: 'HealthyGoWhere App',
    theme: theme(),
    debugShowCheckedModeBanner: false,
    home: BottomNavBar(),
    routes: routes,

  )
);




