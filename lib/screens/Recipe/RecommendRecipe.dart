import '../../CurrentUser.dart';
import 'Recipe.dart';

// will change according to user's preferences
class RecommendRecipe {
  //MealPlan class has a list of meals and nutritional info about the meal plan
  Recipe recipe;
  CurrentUser user;

  RecommendRecipe(Recipe recipe, CurrentUser user){
    this.recipe= recipe;
    this.user= user;
  }

  bool selectedRecipes(Recipe recipe, CurrentUser user){
    bool k= true;
    for(int i=0; i<user.dietList.length;i++){
      if (user.dietList[i] == "Dairy Free"){
        if(recipe.dairyFree== false){
        return false;}
      }
      else if (user.dietList[i]=="Gluten Free"){
        if(recipe.glutenFree==false){
          return false;
        }
      }
      else if (user.dietList[i]=="Ketogenic"){
        if(recipe.ketogenic==false){
          return false;
        }
      }
      else if (user.dietList[i]=="Vegan"){
        if(recipe.vegan==false){
          return false;
        }
      }
      else if (user.dietList[i]=="Vegetarian"){
        if(recipe.vegetarian==false){
          return false;
        }
        else if (user.dietList[i]=="Gluten Free"){
          if(recipe.glutenFree==false){
            return false;
          }
        }
        else if (user.dietList[i]=="Whole 30"){
          if(recipe.whole30==false) {
            return false;
          }
          }
        }
      }

  return k;
    }
  }
