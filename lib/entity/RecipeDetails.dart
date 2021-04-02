//page of recipe instructions
class RecipeDetails {
  final String spoonacularSourceUrl; //has Equipment, Ingredients, Steps, e.t.c

  RecipeDetails({
    this.spoonacularSourceUrl,
  });//The spoonacularSourceURL displays the meals recipe in our webview

  factory RecipeDetails.fromJson(final json) {
    return RecipeDetails(
      spoonacularSourceUrl: json['sourceUrl'],
    );
  }
}