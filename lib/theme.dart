import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Login/LoginPage.dart';


ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'GlacialIndifference',
    appBarTheme: AppBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.grey),
    bodyText2: TextStyle(color: Colors.grey[700]),
  );
}

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

AppBar myAppBar(String title, context, Widget prevPg){
  return AppBar(
    title: Text(title, style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
    ),
  );
}

AppBar AppBarwithIcon(String title, context, Widget prevPg, Icon customIcon){
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
    ),
    title: Row(children: <Widget> [
      Text(title, style: TextStyle(color: Colors.black)),
      SizedBox(width: 140),
      customIcon,
      ]),
 


  );
}
