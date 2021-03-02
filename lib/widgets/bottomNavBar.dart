import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../animation.dart';
import '../screens/Home/HomePage.dart';
import '../screens/Login/LoginPage.dart';
import '../screens/Eateries/EateriesListPage.dart';
import '../screens/Profile/Profile.dart';
import '../screens/Recipe/RecipesListPage.dart';
import 'package:flutter_app/widgets/my_flutter_app_icons.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
// class BottomNavBar extends StatelessWidget {
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    HealthyRecipes(),
    HealthyEateries(),
    Profile()
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