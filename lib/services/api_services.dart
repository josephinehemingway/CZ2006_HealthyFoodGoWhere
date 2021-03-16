import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/screens/Recipe/Recipe.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._instantiate();

  static final ApiService instance = ApiService._instantiate();

  Future<Recipe> getRecipe() async {
    final String _baseURL = "api.spoonacular.com";
    const String API_KEY = "2f3c1b88a1e048819d9d57cad263dc04";

    Map<String, String> parameters = {
      'apiKey': API_KEY,
      'includeNutrition': "true",
    };

    Uri uri = Uri.https(
      _baseURL,
      "/recipes/7429/information",
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
}
