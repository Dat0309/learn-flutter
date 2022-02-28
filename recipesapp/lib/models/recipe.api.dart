import 'dart:convert';

import 'package:recipesapp/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipes() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '54b1ac4d87msh3c2344421713ce5p191fffjsnb7ef2ab486f1',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipeFromSnapshot(_temp);
  }

  static Future<List<Recipe>> getRecipesByCategory(String tag) async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "$tag"});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '54b1ac4d87msh3c2344421713ce5p191fffjsnb7ef2ab486f1',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipeFromSnapshot(_temp);
  }
}
