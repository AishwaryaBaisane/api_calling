import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '9.1 Dummy Json API Calling/Product/Product_provider/Cart_Provider.dart';
import '9.1 Dummy Json API Calling/Product/Product_provider/Product_provider.dart';
import '9.1 Dummy Json API Calling/Product/Product_veiw/Product_Cart_Page.dart';
import '9.1 Dummy Json API Calling/Product/Product_veiw/Product_datail_page.dart';
import '9.1 Dummy Json API Calling/Product/Product_veiw/Product_page.dart';
import '9.1 Dummy Json API Calling/Recipe/Provider/Recipe_provider.dart';
import '9.1 Dummy Json API Calling/Recipe/veiw/Deatail_page.dart';
import '9.1 Dummy Json API Calling/Recipe/veiw/Recipe_Page.dart';
import '9.2 Call Pixabay API/Provider/provider.dart';
import '9.2 Call Pixabay API/view/api_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PixabayProvider(),),
        ChangeNotifierProvider(create: (context) => RecipeProvider(),),
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),

      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=> PixabayApi(),
        '/detail': (context) => ProductDatailPage(),
        '/cart': (context) => ECommerceCartScreen(),
      },
    );
  }
}
