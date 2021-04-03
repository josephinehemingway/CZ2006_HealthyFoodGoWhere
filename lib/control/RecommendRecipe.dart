import '../entity/CurrentUser.dart';
import '../entity/Recipe.dart';

///This is a control class [RecommendRecipe] which will create method to match [Recipe] to [CurrentUser]'s preferences [userdiet]
// will change according to user's preferences
class RecommendRecipe {

  ///Attributes of [RecommendRecipe]
  ///
  ///[userdiet] is the list of user's preferences stored in Firebase Realtime Database
  List<dynamic> userdiet;

  ///Constructor
  RecommendRecipe(List<dynamic> userdiet) {
    this.userdiet = userdiet;
  }

  ///Method to check if [Recipe] generated is suitable for user's preference.
  ///Parameter [recipe] is the recipe object generated from Spoonacular API.
  ///Parameter [userdiet] is the list of preferences of the user.
  ///selectedRecipe will return 0 if [recipe] passes the user's preference test
  ///selectedRecipe will return 1 if [recipe]'s attribute values conflicts with user's preferences.
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