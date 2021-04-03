import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/entity/Recipe.dart';
import 'package:flutter_app/entity/RecipeDetails.dart';
import 'package:flutter_app/control/RecommendRecipe.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class APIRecipeGenerator {
  APIRecipeGenerator._instantiate();

  int id;
  static final APIRecipeGenerator instance = APIRecipeGenerator._instantiate();
  List<Recipe> recipelist = [];

  //add base URL for spoonacular API, endpoint and API key as constant
  final String _baseURL = "api.spoonacular.com";
  static const String API_KEY = "a6412bca93ee4da2b8a5c5010742d652";

  // jo's API key: "a6412bca93ee4da2b8a5c5010742d652"
  // joey's API key: "07eeb2eabcc448ceb5363f7c3dcbf0f5"
  // shannon's API key: "2f3c1b88a1e048819d9d57cad263dc04"

  Future<Recipe> getRecipe(id) async {
    // final String _baseURL = "api.spoonacular.com";
    // const String API_KEY = "a6412bca93ee4da2b8a5c5010742d652";

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

  Future<RecipeDetails> getRecipeDetails(id) async {
    // final String _baseURL = "api.spoonacular.com";
    // const String API_KEY = "a6412bca93ee4da2b8a5c5010742d652";

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
      final jsonRecipeDetails = jsonDecode(response.body);
      RecipeDetails recipeDetails = RecipeDetails.fromJson(jsonRecipeDetails);
      return recipeDetails;
    } else {
      throw Exception();
    }
  }

  Future<List<Recipe>> getListOfRecipe(int size, List<dynamic> userdiet) async {
    int count = 0;
    while(count<size) {
      { RecommendRecipe(userdiet);
        Random random = new Random();
        int id = random.nextInt(80000);
        Recipe recipe = await APIRecipeGenerator.instance.getRecipe(id);
        if (RecommendRecipe.selectedRecipes(recipe, userdiet) == 0) {
          recipelist.add(recipe);
          count++;
        }
      }
    }
    return recipelist;
  }
}




