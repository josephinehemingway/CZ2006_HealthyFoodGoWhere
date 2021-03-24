import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Recipe/RecipeDetails.dart';
import 'package:flutter_app/screens/Recipe/RecipesListPage.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeDetailsPage extends StatefulWidget {
  static String routeName = '/recipeDetails';
  final RecipeDetails recipeDetails;
  RecipeDetailsPage({this.recipeDetails});

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        RecipeAppBar('Recipe Title', context, HealthyRecipes(),
            'images/appbar_recipe.png'),
      ];
    },
      body: WebView(
    initialUrl: widget.recipeDetails.spoonacularSourceUrl,
    //JS unrestricted, so that JS can execute in the webview
    javascriptMode: JavascriptMode.unrestricted,
      ),
      );
  }
}
