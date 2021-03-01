import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'animation.dart';
import 'HomePage.dart';
import 'Login.dart';

void main() => runApp(
  MaterialApp(
    title: 'HealthyGoWhere App',
    theme: ThemeData(fontFamily: 'GlacialIndifference'),
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  )
);

