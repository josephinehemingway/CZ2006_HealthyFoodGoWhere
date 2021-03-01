import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'animation.dart';
import 'HomePage.dart';
import 'Login.dart';
import 'Eateries.dart';
import 'Profile.dart';
import 'Recipes.dart';
import 'package:flutter_app/my_flutter_app_icons.dart';

void main() => runApp(
  MaterialApp(
    title: 'HealthyGoWhere App',
    theme: ThemeData(fontFamily: 'GlacialIndifference'),
    debugShowCheckedModeBanner: false,
    home: BottomNavBar(),
  )
);


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [
    new HomePage(),
    new HealthyRecipes(),
    new HealthyEateries(),
    new Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          selectedItemColor: Colors.teal[300],
          unselectedItemColor: Colors.grey.withOpacity(.60),
          currentIndex: _currentIndex, // new
          backgroundColor: Colors.black12,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.chefhat),
              title: Text('Recipes'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.cutlery),
              title: Text('Eateries'),
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
            )],
        )
    );
  }
}

