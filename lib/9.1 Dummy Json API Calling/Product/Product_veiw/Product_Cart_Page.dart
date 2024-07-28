import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Product_provider/Cart_Provider.dart';

class Cart_page extends StatelessWidget {
  const Cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ...List.generate(CartList.length, (index) => Text('${cartProvider.TotalPrice}'),),
          ],
        )
      ),
    );
  }
}
