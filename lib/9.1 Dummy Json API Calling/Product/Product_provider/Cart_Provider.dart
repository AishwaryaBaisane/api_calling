
import 'package:flutter/material.dart';

import '../Product_veiw/Product_datail_page.dart';

class CartProvider extends ChangeNotifier {

  var price;
  double discount = 0;
  int quantity = 1;
  var total;

  void addQty(int index) {
    qty[index]++;
    setData();
    notifyListeners();
  }

  void setData()
  {
    for(int i = 0; i < CartList.length; i++){
      price = qty[i] * CartList[i].price;
    }
    notifyListeners();

  }
  void removeQty(int index) {
    if(qty[index]>0){
      qty[index]--;
      for(int i = 0; i < CartList.length; i++){
        price = qty[i] * CartList[i].price;
      }
      notifyListeners();
    }
  }

  void removeFromCart(int index){
    price -= CartList[index].price;
    CartList.removeAt(index);
    qty[index] = 1;
    notifyListeners();
  }

  void discountedPrice(){
    for(int i = 0; i < CartList.length; i++){
      price += CartList[i].price;
    }
    notifyListeners();
  }
  void totalPrice(){
    for(int i = 0; i < CartList.length; i++){
      discount += CartList[i].discountPercentage;
      quantity += qty[i];
    }
    notifyListeners();
  }


}

List CartList = [];