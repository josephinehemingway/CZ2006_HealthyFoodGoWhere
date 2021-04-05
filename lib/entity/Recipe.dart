
/// This is an entity class that instantiates a [Recipe] object.
class Recipe {

  /// The [Recipe]'s id.
  int id;

  /// The [Recipe]'s preparation duration in minutes.
  int readyInMinutes;

  /// The [Recipe]'s title.
  String title;

  /// The [Recipe]'s image.
  String image;

  /// The [Recipe]'s summary.
  String summary;

  /// The [Recipe]'s calorie.
  String calories;

  /// The [Recipe]'s dietary considerations list.
  List diets;

  /// Returns true if [diets] list contain these dietary preferences.
  bool dairyFree,glutenFree,ketogenic,vegan,vegetarian,whole30,veryHealthy;

  /// The [Recipe]'s constructor.
  Recipe({
    this.id,
    this.title,
    this.image,
    this.readyInMinutes,
    this.diets,
    this.dairyFree,
    this.glutenFree,
    this.ketogenic,
    this.vegan,
    this.vegetarian,
    this.whole30,
    this.veryHealthy,
    this.summary
  });

  /// A method to obtain [Recipe] details from Json database from the API.
  ///
  /// This class has ID which allows us to get Recipes and other info.
  /// Factory Constructor Recipe.fromMap parases decoded JSON data to get values of the meal and returns Recipe object.
  factory Recipe.fromJson(final json) {
    //Recipe object
    return Recipe(
      id: json['id'],
      title:json['title'],
      image:json['image'],
      readyInMinutes: json['readyInMinutes'],
      diets: json['diets'],
      dairyFree: json['dairyFree'],
      glutenFree: json['glutenFree'],
      ketogenic: json['ketogenic'],
      vegan: json['vegan'],
      vegetarian: json['vegetarian'],
      whole30: json['whole30'],
      veryHealthy: json['veryHealthy'],
      summary: json["summary"]
    );
  }
}