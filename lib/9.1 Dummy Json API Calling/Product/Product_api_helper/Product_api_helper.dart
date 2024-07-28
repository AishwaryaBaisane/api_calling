import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductApiHelper
{
  String api = 'https://dummyjson.com/products';

  Future<Map> Product_Api_Calling()
  async {
    Uri Url = Uri.parse(api);
    Response response = await http.get(Url);
    if(response.statusCode==200)
      {
        final json = response.body;
        final Map data = jsonDecode(json);
        return data;
      }
    else
      {
        return {};
      }
  }
}
