import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier
{
  double TotalPrice = 0;

  void CartData()
  {
    for(int i=0; i<CartList.length; i++)
      {
        TotalPrice += CartList[i].TotalPrice;
      }
    notifyListeners();
  }

}

List CartList = [];

// import 'package:adv_ch_9/utils/global.dart';
// import 'package:flutter/material.dart';
//
// class ECommerceCartProvider extends ChangeNotifier {
//
//   double price = 0;
//   double discount = 0;
//   int quantity = 1;
//
//   void addQty(int index) {
//     qty[index]++;
//     notifyListeners();
//     print('-------------------add-----------------------------');
//   }
//
//   void removeQty(int index) {
//     if(qty[index]>0){
//       qty[index]--;
//       print('-------------------------remove---------------------------------');
//       notifyListeners();
//     }
//   }
//
//   void removeFromCart(int index){
//     price -= cartList[index].price;
//     cartList.removeAt(index);
//     qty[index] = 1;
//     notifyListeners();
//   }
//
//   void discountedPrice(){
//     for(int i = 0; i < cartList.length; i++){
//       price += cartList[i].price;
//     }
//     notifyListeners();
//   }
//   void totalPrice(){
//     for(int i = 0; i < cartList.length; i++){
//       discount = cartList[i].discountPercentage + cartList[i].price;
//       quantity += qty[i];
//     }
//     notifyListeners();
//   }
// }
//
// List cartList = [];