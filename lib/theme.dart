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
    centerTitle: true,
    title: Text(title, style: TextStyle(fontSize: 22, color: Colors.black)),
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

AppBar AppBarwithFilter(String title, context, Widget prevPg, String image){
  return AppBar(
    centerTitle: true,
    flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        child:(Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill
            )
          ),
        ))),
    backgroundColor: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (prevPg)));
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
    ),

    title: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),

    actions: <Widget>[
      IconButton(icon: Icon(Icons.filter_alt, size: 22, color: Colors.white,),
            onPressed: (){
              // Navigator.pop(context);
            }
        ),
      ],
  );
}
