import 'package:flutter/material.dart';

/// Application overall theme data.
ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'GlacialIndifference',
    appBarTheme: AppBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

/// Application Text theme.
TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.grey),
    bodyText2: TextStyle(color: Colors.grey[700]),
  );
}

/// Application App Bar theme.
AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}


