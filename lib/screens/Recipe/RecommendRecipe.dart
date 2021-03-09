import 'Recipe.dart';

// will change according to user's preferences
class RecommendRecipe {
  //MealPlan class has a list of meals and nutritional info about the meal plan
  final List<Recipe> recipe;
  final double calories, carbs, fat, protein;
  RecommendRecipe({
    this.recipe, this.calories, this.carbs, this.fat, this.protein
  });
/*
The factory constructor iterates over the list of meals and our decoded mealplan
data and creates a list of meals.
Then, we return MealPlan object with all the information 
*/
  factory RecommendRecipe.fromMap(Map<String, dynamic> map) {
    List<Recipe> recipe = [];
    map['meals'].forEach((mealMap) => recipe.add(Recipe.fromMap(mealMap)));
    //MealPlan object with information we want
    return RecommendRecipe(
      recipe: recipe,

      calories: map['nutrients']['calories'],
      // carbs: map['nutrients']['carbohydrates'],
      // fat: map['nutrients']['fat'],
      // protein: map['nutrients']['protein'],
    );
  }
}