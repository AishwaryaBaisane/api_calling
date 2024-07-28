import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecipeApiHelper {

  String api = 'https://pixabay.com/api/?key=45140193-022d8adb1e5eee0ac2ab1bcac&q=recipes&image_type=photo&pretty=true';

  Future<Map> Recipe_Api_Calling() async
  {
    Uri Url = Uri.parse(api);
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
