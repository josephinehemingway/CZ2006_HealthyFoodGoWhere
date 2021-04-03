import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screens/Home/HomeUI.dart';
import '../screens/Eateries/EateriesListUI.dart';
import '../screens/Profile/ProfileUI.dart';
import '../screens/Recipe/RecipesListUI.dart';
import 'customIcons.dart';

/// ['MenuState'] enumerates the page routes for each item in the bottom navigation bar.
enum MenuState { home, recipe, eatery, profile }

/// This is the boundary class for displaying a custom bottom navigation bar widget.
///
/// Used in every page of the application consistently.
/// Consists of navigation buttons to HomeUI, RecipeListUI, EateryListUI and ProfileUI.
class BottomNavBar extends StatelessWidget {

  /// Class constructor for BottomNavBar
  const BottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  /// Parameter for BottomNavBar.
  ///
  /// ['selectedMenu'] is the currently selected item of the bottom navigation bar.
  /// It must correspond to the currently active page.
  ///
  /// When selected, the bottom navigation bar item that is active will turn teal-coloured.
  /// When not selected, the bottom navigation icons that are inactive remain grey.
  final MenuState selectedMenu;

  // Widget Build method to implement the BottomNavBar.
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
                  Navigator.pushNamed(context, ProfileUI.routeName);
                  },
              ),
            ],
          )),
    );
  }
}