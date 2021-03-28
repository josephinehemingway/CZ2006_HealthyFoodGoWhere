import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/Recipe/Recipe.dart';
import 'package:flutter_app/screens/Recipe/RecipeCard.dart';
import 'package:flutter_app/screens/Recipe/RecipeDetails.dart';
import 'package:flutter_app/screens/Recipe/RecommendRecipe.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import '../CurrentUser.dart';

class ApiService {
  ApiService._instantiate();

  int id;
  static final ApiService instance = ApiService._instantiate();
  List<Recipe> recipelist = [];


  //add base URL for spoonacular API, endpoint and API key as constant
  final String _baseURL = "api.spoonacular.com";
  static const String API_KEY = "07eeb2eabcc448ceb5363f7c3dcbf0f5";

  Future<Recipe> getRecipe(id) async {
    final String _baseURL = "api.spoonacular.com";
    const String API_KEY = "07eeb2eabcc448ceb5363f7c3dcbf0f5";

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
    final String _baseURL = "api.spoonacular.com";
    const String API_KEY = "07eeb2eabcc448ceb5363f7c3dcbf0f5";

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

  Future<List<Recipe>> getListOfRecipe(int size, CurrentUser user) async {
    int count = 0;
    while(count<size) {
      { RecommendRecipe(user);
        Random random = new Random();
        int id = random.nextInt(8000);
        Recipe recipe = await ApiService.instance.getRecipe(id);
        if (RecommendRecipe.selectedRecipes(recipe, user) == 0) {
          recipelist.add(recipe);
          count++;
        }
      }
    }
    return recipelist;
  }
}




