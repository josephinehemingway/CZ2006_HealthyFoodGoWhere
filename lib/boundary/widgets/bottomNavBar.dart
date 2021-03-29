import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screens/Home/HomeUI.dart';
import '../screens/Eateries/EateriesListUI.dart';
import '../screens/Profile/ProfileUI.dart';
import '../screens/Recipe/RecipesListUI.dart';
import 'customIcons.dart';

/*
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

 */

enum MenuState { home, recipe, eatery, profile }

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                  color: MenuState.home == selectedMenu
                      ? Colors.teal[300]
                      : Colors.grey.withOpacity(.40),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HomeUI.routeName);
                },
              ),
              IconButton(
                icon: Icon(MyFlutterApp.chefhat),
                color: MenuState.recipe == selectedMenu
                    ? Colors.teal[300]
                    : Colors.grey.withOpacity(.40),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HealthyRecipesList.routeName);
                },
              ),
              IconButton(
                icon: Icon(MyFlutterApp.cutlery),
                color: MenuState.eatery == selectedMenu
                    ? Colors.teal[300]
                    : Colors.grey.withOpacity(.40),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HealthyEateriesList.routeName);
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                  color: MenuState.profile == selectedMenu
                      ? Colors.teal[300]
                      : Colors.grey.withOpacity(.40),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Profile.routeName);
                  },
              ),
            ],
          )),
    );
  }
}