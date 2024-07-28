
import 'package:flutter/cupertino.dart';

import '../../../9.2 Call Pixabay API/modal/api_modal.dart';
import '../Product_api_helper/Product_api_helper.dart';

class ProductProvider extends ChangeNotifier
{
  ProductApiHelper apiHelper = ProductApiHelper();
  PixabayModal? productModal;

  Future<PixabayModal?> fromMap()
  async {
    final data = await apiHelper.Product_Api_Calling();
    productModal = PixabayModal.fromMap(data);
    notifyListeners();
    return productModal;

  }

}