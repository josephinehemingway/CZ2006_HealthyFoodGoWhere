import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Eateries/EateriesListPage.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import 'package:flutter_app/screens/Login/LoginPage.dart';
import 'package:flutter_app/screens/Profile/Profile.dart';
import 'package:flutter_app/screens/Recipe/RecipeDetailsPage.dart';
import 'package:flutter_app/screens/Recipe/RecipesListPage.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  HealthyEateries.routeName: (context) => HealthyEateries(),
  HealthyRecipes.routeName: (context) => HealthyRecipes(),
  Profile.routeName: (context) => Profile(),
  LoginPage.routeName: (context) => LoginPage(),
  RecipeDetailsPage.routeName: (context) => RecipeDetailsPage()
};

