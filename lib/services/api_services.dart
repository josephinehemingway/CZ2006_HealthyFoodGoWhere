import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/Recipe/Recipe.dart';
import 'package:flutter_app/screens/Recipe/RecipeCard.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class ApiService {
  ApiService._instantiate();

  static final ApiService instance = ApiService._instantiate();

  //add base URL for spoonacular API, endpoint and API key as constant
  final String _baseURL = "api.spoonacular.com";
  static const String API_KEY = "2f3c1b88a1e048819d9d57cad263dc04";

  Future<Recipe> getRecipe(id) async {
    final String _baseURL = "api.spoonacular.com";
    const String API_KEY = "2f3c1b88a1e048819d9d57cad263dc04";

    Map<String, String> parameters = {
      'apiKey': API_KEY,
      'includeNutrition': "true",
    };

    Uri uri = Uri.https(
      _baseURL,
      "/recipes/${id}/information",
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final jsonRecipe = jsonDecode(response.body);
      return Recipe.fromJson(jsonRecipe);
    } else {
      throw Exception();
    }
  }

  Future<List<Recipe>> getListOfRecipe(int size) async{
    List<Recipe> recipelist;
    for (int i=0; i<size; i++){
      Random random= new Random();
      int id= random.nextInt(8000);
      Recipe recipe = await ApiService.instance.getRecipe(id);
      recipelist.add(recipe);
    }

    return recipelist;
  }

  Future<List<Widget>> getListOfRecipeCard() async{
    List<Widget> cardlist;
    for(int i=0;i<3;i++){
      Random random= new Random();
      int id= random.nextInt(8000);
      Recipe recipe = await ApiService.instance.getRecipe(id);
      RecipeCard recipeCard = RecipeCard(
          imageUrl:recipe.image,
          title:recipe.title,
          duration:recipe.readyInMinutes,
          calories:"500 kCal");
      cardlist.add(recipeCard);
    }
    return cardlist;
  }


}