import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Eateries/EateriesListUI.dart';
import 'package:flutter_app/screens/Eateries/googleMapUI.dart';
import 'package:flutter_app/screens/Home/HomeUI.dart';
import 'package:flutter_app/screens/Login/LoginUI.dart';
import 'package:flutter_app/screens/Profile/EditPreferencesUI.dart';
import 'package:flutter_app/screens/Profile/ProfileUI.dart';
import 'package:flutter_app/screens/Recipe/RecipeDetailsUI.dart';
import 'package:flutter_app/screens/Recipe/RecipesListUI.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  HealthyEateriesList.routeName: (context) => HealthyEateriesList(),
  HealthyRecipesList.routeName: (context) => HealthyRecipesList(),
  Profile.routeName: (context) => Profile(),
  LoginPage.routeName: (context) => LoginPage(),
  RecipeDetailsPage.routeName: (context) => RecipeDetailsPage(),
  EditPreferences.routeName: (context) => EditPreferences(),
  GoogleMapScreen.routeName: (context) => GoogleMapScreen()
};

