import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RecipeApiHelper{

  Future<Map> Recipe_Api_Calling() async {
    Uri url = Uri.parse('https://dummyjson.com/recipes');
    Response response = await http.get(url);

    if(response.statusCode == 200){
      final Map data = jsonDecode(response.body);
      return data;
    }
    else{
      return {};
    }
  }
}