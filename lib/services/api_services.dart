import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/screens/Recipe/RecipeDetails.dart';
import 'package:flutter_app/screens/Recipe/RecommendRecipe.dart';
import 'package:http/http.dart' as http;

class ApiService{
  ApiService._instantiate();
  static final ApiService instance = ApiService._instantiate();

  final String _baseURL = "api.spoonacular.com";
  static const String API_KEY = "2f3c1b88a1e048819d9d57cad263dc04";


  //We create async function to generate meal plan which takes in
  //diet restrictions, intolerances
  //If diet/intol is none, we set the diet into an empty string

  Future<RecommendRecipe> generateRecipes({String diet, String intolerances}) async {
    //check if diet is null
    if (diet == 'None') diet = '';
    if (intolerances == 'None') intolerances = '';
    Map<String, String> parameters = {
      'diet': diet,
      'exclude': intolerances,
      'apiKey': API_KEY,
    };

      // RecommendRecipe recommendRecipe = RecommendRecipe.fromMap(data);

//the fetchRecipe takes in the id of the recipe we want to get the info for
  //We also specify in the parameters that we don't want to include the nutritional
  //information
  //We also parse in our API key
  Future<RecipeDetails> fetchRecipe(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      'apiKey': API_KEY,
    };
//we call in our recipe id in the Uri, and parse in our parameters
    Uri uri = Uri.https(
      _baseURL,
      '/recipes/$id/information',
      parameters,
    );
//And also specify that we want our header to return a json object
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
//finally, we put our response in a try catch block
    try{
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      RecipeDetails recipeDetails = RecipeDetails.fromMap(data);
      return recipeDetails;
    }catch (err) {
      throw err.toString();
    }
  }

}
