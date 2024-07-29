import 'package:flutter/material.dart';

import '../../../Utils/Global_data.dart';
import '../Product_veiw/Product_datail_page.dart';

class CartProvider extends ChangeNotifier {
  double price = 0;
  double discount = 0;
  int quantity = 1;

  void addQty(int index) {
    qty[index]++;
    notifyListeners();
  }

  void removeQty(int index) {
    if (qty[index] > 0) {
      qty[index]--;
      notifyListeners();
    }
  }

  void removeFromCart(int index) {
    price -= CartList[index].price;
    CartList.removeAt(index);
    qty[index] = 1;
    notifyListeners();
  }

  void discountedPrice() {
    for (int i = 0; i < CartList.length; i++) {
      price += CartList[i].price;
    }
    notifyListeners();
  }

  void totalPrice() {
    for (int i = 0; i < CartList.length; i++) {
      discount = CartList[i].discountPercentage + CartList[i].price;
      quantity += qty[i];
    }
    notifyListeners();
  }
}

List CartList = [];
