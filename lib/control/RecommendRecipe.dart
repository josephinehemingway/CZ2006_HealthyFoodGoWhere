import '../entity/CurrentUser.dart';
import '../entity/Recipe.dart';

// will change according to user's preferences
class RecommendRecipe {
  //MealPlan class has a list of meals and nutritional info about the meal plan
  List<dynamic> userdiet;

  RecommendRecipe(List<dynamic> userdiet) {
    this.userdiet = userdiet;
  }

  static int selectedRecipes(Recipe recipe, List<dynamic> userdiet) {
    int k = 0;

    if (userdiet.isEmpty){
      return 0;
    }
    else{
      for (int i = 0; i < userdiet.length; i++) {
        if (userdiet[i] == "Dairy Free") {
          if (recipe.dairyFree == false) {
            return 1;
          }
        }
        else if (userdiet[i] == "Gluten Free") {
          if (recipe.glutenFree == false) {
            return 1;
          }
        }
        else if (userdiet[i] == "Ketogenic") {
          if (recipe.ketogenic == false) {
            return 1;
          }
        }
        else if (userdiet[i] == "Vegan") {
          if (recipe.vegan == false) {
            return 1;
          }
        }
        else if (userdiet[i] == "Vegetarian") {
          if (recipe.vegetarian == false) {
            return 1;
          }
        }
        else if (userdiet[i] == "Whole30") {
          if (recipe.whole30 == false) {
            return 1;
          }
        }
      }

      return k;
      }
    }
}