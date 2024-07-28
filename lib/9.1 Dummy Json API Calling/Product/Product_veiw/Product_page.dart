import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Product_Modal/product_modal.dart';
import '../Product_provider/Product_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.account_circle_outlined,
          size: 30,
        ),
        scrolledUnderElevation: 0.1,
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false).fromMap(),
        builder: (context, snapshot) {
          ProductModal? apiModal = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: productProvider.productModal!.products.length,
                itemBuilder: (context, index) => Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:  NetworkImage(apiModal!.products[index].images),
                      // NetworkImage(apiModal!.hits[index].webformatURL) ,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    '${apiModal.products[index].rating}',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
