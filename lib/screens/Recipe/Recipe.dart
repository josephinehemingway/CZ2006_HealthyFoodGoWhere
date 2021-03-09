class Recipe {

  final int id;
  final String title, imgURL;

  Recipe({
    this.id,
    this.title,
    this.imgURL

  });

  factory Recipe.fromMap(Map<String, dynamic> map){
    return Recipe(
      id: map['id'],
      title: map['title'],
      imgURL: 'https://spoonacular.com/recipeImages/' + map['image'],
    );
  }

}