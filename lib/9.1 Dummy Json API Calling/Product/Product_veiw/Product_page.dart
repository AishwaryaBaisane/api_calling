import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Global_data.dart';
import '../Product_Modal/product_modal.dart';
import '../Product_provider/Product_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
        title: Text(
          'Products',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: width * 0.06,
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false).fromJson(),
        builder: (context, snapshot) {
          ProductModal? apiModal = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          ImgList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.25,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(ImgList[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    ' All Recipes ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: apiModal!.products.length,
                      itemBuilder: (context, index) => Card(
                        child: Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectIndex = index;
                                  Navigator.of(context).pushNamed('/detail');
                                },
                                child: Container(
                                  height: 200,
                                  width: 170,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          apiModal.products[index].thumbnail),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * 0.45,
                                    child: Text(
                                      apiModal.products[index].title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Price : \$',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '${apiModal.products[index].price}',
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${apiModal.products[index].category}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    '${apiModal.products[index].rating} ⭐',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
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
    );
  }
}

