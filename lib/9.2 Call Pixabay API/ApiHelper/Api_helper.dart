import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper
{
  Future<Map> apiCalling(String search) async {
    Uri Url = Uri.parse(
        'https://pixabay.com/api/?key=45140193-022d8adb1e5eee0ac2ab1bcac&q=$search&image_type=photo&pretty=true');
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
