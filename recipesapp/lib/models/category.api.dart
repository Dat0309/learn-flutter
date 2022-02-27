import 'dart:convert';

import 'package:recipesapp/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  static Future<List<Category>> getCategories() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/categories/list');

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '54b1ac4d87msh3c2344421713ce5p191fffjsnb7ef2ab486f1',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['browse-categories']) {
      _temp.add(i['display']);
    }

    return Category.categoriesFromSnapshot(_temp);
  }
}
