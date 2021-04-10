import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/entity/Recipe.dart';
import 'package:flutter_app/entity/RecipeDetails.dart';
import 'package:flutter_app/control/RecommendRecipe.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

/// This is a control class [APIRecipeGenerator] which instantiates API instance to access Spoonacular API.
class APIRecipeGenerator {
  APIRecipeGenerator._instantiate();

  /// Attributes of [APIRecipeGenerator].
  ///
  /// id of Recipe to be fetched from API.
  int id;

  /// API instance to access API.
  static final APIRecipeGenerator instance = APIRecipeGenerator._instantiate();

  /// List of [Recipe] to store Recipe Objects.
  List<Recipe> recipelist = [];

  /// Base URL for Spoonacular API.
  final String _baseURL = "api.spoonacular.com";

  /// API key for Spoonacular API.
  static const String API_KEY = "a6412bca93ee4da2b8a5c5010742d652";
  // static const String API_KEY = "07eeb2eabcc448ceb5363f7c3dcbf0f5";
  // static const String API_KEY = "2f3c1b88a1e048819d9d57cad263dc04";
  // static const String API_KEY = "9c6beec71bef4c52a9258f6e3b751491";

  // jo's API key: "a6412bca93ee4da2b8a5c5010742d652"
  // joey's API key: "07eeb2eabcc448ceb5363f7c3dcbf0f5"
  // shannon's API key: "2f3c1b88a1e048819d9d57cad263dc04"
  // kenn's API key: "9c6beec71bef4c52a9258f6e3b751491"

  /// Getter for [Recipe] object using recipe's [id].
  Future<Recipe> getRecipe(id) async {
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

  /// Getter for Recipe's details [RecipeDetail]
  Future<RecipeDetails> getRecipeDetails(id) async {
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

  /// Getter method to get a List of [Recipe]s.
  ///
  /// Parameters [size] is the number of recipe cards that would be generated on [RecipeListPageUI].
  /// Parameter [userdiet] is the list of user preferences to obtain recipes suited to the user.
  /// If [RecommendRecipe] selectedRecipe method returns 0, [Recipe] object passes the user's preference test and is added to [recipelist].
  /// Else, [Recipe] object is not added into [recipelist].
  Future<List<Recipe>> getListOfRecipe(int size, List<dynamic> userdiet) async {
    int count = 0;
    while(count<size) {
      /// Instantiate [RecommendRecipe] by inputting [userdiet] list.
      { RecommendRecipe(userdiet);
        Random random = new Random();
        ///Generates random numbers from 1-80000 to be used as Recipe [id].
        int id = random.nextInt(80000);
        //Method to get [Recipe] object by calling getRecipe Method.
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




