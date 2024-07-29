import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Global_data.dart';
import '../Product_provider/Cart_Provider.dart';
import '../Product_provider/Product_provider.dart';
import 'Product_datail_page.dart';

class ECommerceCartScreen extends StatelessWidget {
  const ECommerceCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    CartProvider ecommerceCartProviderFalse =
        Provider.of<CartProvider>(context, listen: false);
    CartProvider ecommerceCartProviderTrue =
        Provider.of<CartProvider>(context, listen: true);
    ProductProvider ecommerceProviderFalse =
        Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Cart Page',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        body: FutureBuilder(
          future: ecommerceProviderFalse.fromJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ...List.generate(
                      CartList.length,
                      (index) => cartContainer(
                        height: height,
                        width: width,
                        ecommerceCartProviderFalse: ecommerceCartProviderFalse,
                        index: index,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        bottomNavigationBar: SizedBox(
          height: height * 0.08,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount:- ${ecommerceCartProviderTrue.price }',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.09,
              ),
              Container(
                height: height * 0.06,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Shop Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),),
              ),
              SizedBox(width: width * 0.03,),
            ],
          ),
        ),
      ),
    );
  }

  Card cartContainer({
    required double height,
    required double width,
    required CartProvider ecommerceCartProviderFalse,
    required int index,
  }) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height * 0.2,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.network(CartList[index].thumbnail),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    ecommerceCartProviderFalse.removeFromCart(index);
                  },
                  child: const Icon(Icons.delete),
                ),
                SizedBox(
                  height: height * 0.0018,
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    CartList[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    '\$${CartList[index].price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ecommerceCartProviderFalse.removeQty(index);
                        },
                        child: const Icon(Icons.remove),
                      ),
                      Text(qty[index].toString()),
                      GestureDetector(
                        onTap: () {
                          ecommerceCartProviderFalse.addQty(index);
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
