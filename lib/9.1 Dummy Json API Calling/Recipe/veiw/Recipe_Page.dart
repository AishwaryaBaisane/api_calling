import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../9.2 Call Pixabay API/modal/api_modal.dart';
import '../Provider/Recipe_provider.dart';
import '../modal/Recipe_modal.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of(context);
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
        future: Provider.of<RecipeProvider>(context, listen: false)
            .fromJson(),
        builder: (context, snapshot) {
          RecipeModal? apiModal = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: recipeProvider.recipeModal!.recipes.length,
                itemBuilder: (context, index) => Container(
                  height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(apiModal!.recipes[index].image),
                    ),
                  ),
                  child: Text('${apiModal.recipes[index].rating}'),
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
