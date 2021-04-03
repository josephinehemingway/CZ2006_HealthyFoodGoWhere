import 'package:flutter/material.dart';
import 'package:flutter_app/boundary/screens/Recipe/RecipeDetailsUI.dart';
import 'package:flutter_app/entity/RecipeDetails.dart';
import 'package:flutter_app/control/APIRecipeGenerator.dart';

/// This is the boundary class for displaying a Recipe Card widget.
///
/// Used in RecipeListUI.
/// Consists of recipe title, recipe image, calories of recipe,
/// duration of preparation of recipe and id of recipe.
class RecipeCard extends StatelessWidget {

  /// Parameters of [RecipeCard]
  ///
  /// Recipe image url to be placed as background of RecipeCard.
  /// For network images only.
  String imageUrl;

  /// Parameters of [RecipeCard]
  ///
  /// Title of the recipe to be displayed on the RecipeCard.
  String title;

  /// Parameters of [RecipeCard]
  ///
  /// ['duration'] is the duration of preparation of the recipe.
  /// ['id'] is the recipe ID.
  int duration, id;

  /// Parameters of [RecipeCard]
  ///
  /// Calories of the recipe to be displayed on the RecipeCard.
  String calories;

  /// Class constructor for [RecipeCard]
  RecipeCard({Key key,
    this.imageUrl,
    this.title,
    this.duration,
    this.calories,
    this.id
  }) : super(key: key);

  /// Widget build method to implement the [RecipeCard].
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            GestureDetector(
              onTap: () async {
                RecipeDetails recipeDetails = await APIRecipeGenerator.instance.getRecipeDetails(id);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => (RecipeDetailsUI(
                  recipeDetails: recipeDetails, recipeTitle: title, recipeImg: imageUrl,
                ))));
              },
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 0,
                  ),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl),fit: BoxFit.fill),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.black.withOpacity(0.33),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                        child: Center(
                            child: Column(
                                children: [
                                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(duration.toString() + " mins", style: TextStyle(fontSize: 16, color: Colors.white)),
                                  Text(calories + " calories", style: TextStyle(fontSize: 16, color: Colors.white))])
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}



