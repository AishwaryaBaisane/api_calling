import 'package:api_calling/9.1%20Dummy%20Json%20API%20Calling/Product/Product_veiw/Product_Cart_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Product_provider/Cart_Provider.dart';
import '../Product_provider/Product_provider.dart';
import 'Product_page.dart';

class ProductDatailPage extends StatelessWidget {
  const ProductDatailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CartProvider cartProvider  = Provider.of(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
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
            'Detail Page',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: height * 0.38,
                      width: width * 0.999,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(productProvider
                                .productModal!.products[selectIndex].thumbnail),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productProvider
                                  .productModal!.products[selectIndex].title,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                                // height: height * 0.01,
                                ),
                            Row(
                              children: [
                                Text(
                                  'Price : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${productProvider.productModal!.products[selectIndex].discountPercentage} ',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${productProvider.productModal!.products[selectIndex].price}',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Category : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${productProvider.productModal!.products[selectIndex].category} ',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              '${productProvider.productModal!.products[selectIndex].description} ',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.16,
                                ),
                                Text(
                                  '⭐ ⭐ ⭐ ⭐ ⭐',
                                  style: TextStyle(fontSize: 35),
                                ),
                              ],
                            ),
                            Text(
                              'Reviews',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            ...List.generate(
                              productProvider.productModal!
                                  .products[selectIndex].reviews.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.start,
                                      '${productProvider.productModal!.products[selectIndex].reviews[index].reviewerName} ',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      '${productProvider.productModal!.products[selectIndex].reviews[index].comment} ',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(onTap: () {
          CartList.add(productProvider
              .productModal!
              .products[selectIndex]);
          for(int i = 0; i < productProvider.productModal!.products.length; i++){
            qty.add(selectIndex);
          }
          cartProvider.discountedPrice();
          cartProvider.totalPrice();
          Navigator.of(context).pushNamed('/cart');
        },
          child: Container(
            height: height * 0.09,
            width: width * 0.5,
            color: Colors.black,
            child: Center(
              child: Text(
                'Add To Cart',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


int NewSelectIndex =0;

List<int> qty = [];