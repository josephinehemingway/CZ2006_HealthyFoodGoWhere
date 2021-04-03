import 'package:flutter/material.dart';
import 'package:flutter_app/entity/RecipeDetails.dart';
import '../../widgets/customAppBar.dart';
import 'RecipesListUI.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/bottomNavBar.dart';
import 'package:flutter_app/boundary/widgets/animation.dart';

/// This is the boundary class which displays the Individual Recipes Screen in the mobile UI.
class RecipeDetailsUI extends StatefulWidget {

  /// The route name for navigation to [RecipeDetailsUI].
  static String routeName = '/recipeDetails';
  
  /// Parameters for [RecipeDetailsUI].
  final RecipeDetails recipeDetails;

  /// Parameters for [RecipeDetailsUI].
  final String recipeTitle, recipeImg;

  /// Class constructor for [RecipeDetailsUI].
  RecipeDetailsUI({
    this.recipeDetails,
    this.recipeTitle,
    this.recipeImg
  });

  @override
  _RecipeDetailsUIState createState() => _RecipeDetailsUIState();
}

/// This class manages the state of the [RecipeDetailsUI].
///
/// Includes the business logic behind [RecipeDetailsUI].
class _RecipeDetailsUIState extends State<RecipeDetailsUI> {
  
  /// Widget build method to implement [RecipeDetailsUI].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.recipe),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            RecipeAppBar(widget.recipeTitle, context, HealthyRecipesList(),
                widget.recipeImg),
          ];
        },

        // To display the website of the recipe selected.
        body: WebView(
          initialUrl: widget.recipeDetails.spoonacularSourceUrl,
          //JS unrestricted, so that JS can execute in the webview
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
