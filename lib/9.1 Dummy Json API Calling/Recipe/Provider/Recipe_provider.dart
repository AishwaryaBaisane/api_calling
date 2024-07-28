
import 'package:api_calling/9.1%20Dummy%20Json%20API%20Calling/Recipe/api_helper/Recipe_json_api.dart';
import 'package:flutter/cupertino.dart';

import '../../../9.2 Call Pixabay API/modal/api_modal.dart';
class RecipeProvider extends ChangeNotifier
{
  RecipeApiHelper apiHelper = RecipeApiHelper();
  PixabayModal? recipeModal;

  Future<PixabayModal?> fromMap()
  async {
    final data = await apiHelper.Recipe_Api_Calling();
    recipeModal = PixabayModal.fromMap(data);
    notifyListeners();
    return recipeModal;

  }

}

