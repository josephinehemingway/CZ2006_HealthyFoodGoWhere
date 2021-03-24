class Recipe {
  int id,readyInMinutes;
  String title, image;
  List diets;
  bool dairyFree,glutenFree,ketogenic,vegan,vegetarian,whole30;
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
    this.whole30
  });

  //This class has ID which allows us to get Recipes and other info
  //Factory Constructor Recipe.fromMap parases decoded JSON data to get values of the meal and returns Recipe object
  factory Recipe.fromJson(final json) {
    //Recipe object
    return Recipe(
      id: json['id'],
      title:json['title'],
      image:json['image'],
      readyInMinutes: json['readyInMinutes'],

    );
  }

  getRecipeID() {
    return this.id;
  }

  getRecipeTitle() {
    return this.title;
  }

  getRecipeImg() {
    return this.image;
  }

  getDuration() {
    return this.readyInMinutes;
  }
}