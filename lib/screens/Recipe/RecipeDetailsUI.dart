import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Recipe/RecipeDetails.dart';
import 'package:flutter_app/screens/Recipe/RecipesListUI.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeDetailsPage extends StatefulWidget {
  static String routeName = '/recipeDetails';
  final RecipeDetails recipeDetails;
  final String recipeTitle, recipeImg;

  RecipeDetailsPage({
    this.recipeDetails,
    this.recipeTitle,
    this.recipeImg
  });

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}



class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        RecipeAppBar(widget.recipeTitle, context, HealthyRecipes(),
            widget.recipeImg),
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
