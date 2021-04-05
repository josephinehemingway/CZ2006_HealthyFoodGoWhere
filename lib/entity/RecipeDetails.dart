
/// This is the entity class to instantiate [RecipeDetails] object.
class RecipeDetails {

  /// The source url of the Json data.
  ///
  /// Contains the details of [RecipeDetails] including the equipment, ingredients and steps needed.
  final String spoonacularSourceUrl;

  /// The constructor for [RecipeDetails].
  ///
  /// The spoonacularSourceURL displays the [RecipeDetails] in a webview.
  RecipeDetails({
    this.spoonacularSourceUrl,
  });

  /// A method to obtain [RecipeDetails] contents from Json.
  factory RecipeDetails.fromJson(final json) {
    return RecipeDetails(
      spoonacularSourceUrl: json['sourceUrl'],
    );
  }
}