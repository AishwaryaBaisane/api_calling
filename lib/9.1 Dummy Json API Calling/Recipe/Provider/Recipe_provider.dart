
import 'package:api_calling/9.1%20Dummy%20Json%20API%20Calling/Recipe/api_helper/Recipe_json_api.dart';
import 'package:flutter/cupertino.dart';
import '../modal/Recipe_modal.dart';
class RecipeProvider extends ChangeNotifier
{
  RecipeApiHelper apiHelper = RecipeApiHelper();
  RecipeModal? recipeModal;

  Future<RecipeModal?> fromJson()
  async {
    final data = await apiHelper.Recipe_Api_Calling();
    recipeModal = RecipeModal.fromJson(data);
    notifyListeners();
    return recipeModal;

  }

}

