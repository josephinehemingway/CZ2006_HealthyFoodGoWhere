class Recipe {
  int id;
  String title, image, readyInMinutes;
  List diets;

  Recipe({
    this.id,
    this.title,
    this.image,
    this.readyInMinutes,
    this.diets,
  });

  //This class has ID which allows us to get Recipes and other info
  //Factory Constructor Recipe.fromMap parases decoded JSON data to get values of the meal and returns Recipe object
  factory Recipe.fromJson(final json) {
    //Recipe object
    return Recipe(
      id: json['id'],
      title: json['title'],
      image: 'https://spoonacular.com/recipeImages/' + json['image'],
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