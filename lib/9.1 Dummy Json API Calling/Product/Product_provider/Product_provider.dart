
import 'package:flutter/cupertino.dart';

import '../../../9.2 Call Pixabay API/modal/api_modal.dart';
import '../Product_Modal/product_modal.dart';
import '../Product_api_helper/Product_api_helper.dart';

class ProductProvider extends ChangeNotifier
{
  ProductApiHelper apiHelper = ProductApiHelper();
  ProductModal? productModal;

  Future<ProductModal?> fromJson()
  async {
    final data = await apiHelper.Product_Api_Calling();
    productModal = ProductModal.fromJson(data);
    notifyListeners();
    return productModal;

  }

}
