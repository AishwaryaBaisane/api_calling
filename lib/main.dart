import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '9.1 Dummy Json API Calling/Recipe/Provider/Recipe_provider.dart';
import '9.1 Dummy Json API Calling/Recipe/veiw/Recipe_Page.dart';
import '9.2 Call Pixabay API/Provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PixabayProvider(),),
        ChangeNotifierProvider(create: (context) => RecipeProvider(),)
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
        '/':(context)=> RecipePage()
      },
    );
  }
}
