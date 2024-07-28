import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../9.2 Call Pixabay API/modal/api_modal.dart';
import '../Provider/Recipe_provider.dart';
import '../modal/Recipe_modal.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    RecipeProvider recipeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          'Recipe ',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: Provider.of<RecipeProvider>(context, listen: false).fromJson(),
        builder: (context, snapshot) {
          RecipeModal? apiModal = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: recipeProvider.recipeModal!.recipes.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        selectINdex = index;
                        Navigator.of(context).pushNamed('/detail');
                      },
                      child: Container(
                        height: height * 0.2,
                        width: width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(apiModal!.recipes[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.4,
                          child: Text(
                            // textAlign: TextAlign.center,
                            apiModal!.recipes[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.reviews),
                            Text(
                              '${apiModal.recipes[index].reviewCount}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.,
                          children: [
                            Text(
                              apiModal.recipes[index].difficulty,
                              style: TextStyle(fontSize: 16),
                            ),

                            SizedBox(
                              width: width * 0.1,
                            ),
                            Text(
                              // textAlign: TextAlign.center,
                              apiModal.recipes[index].cuisine,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
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

int selectINdex = 0;
// height: 200,
//                     width: double.infinity,
//                     margin: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(apiModal!.recipes[index].image),
//                         ),
//                         boxShadow: [BoxShadow(color: Colors.black26)]),
//                     child: Center(
//                       child: Container(
//                         height: 200,//                         decoration: BoxDecoration(
//                           color: Colors.black26,apiModal.recipes[index].name
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Center(
//                           child: Text(
//                             '${apiModal.recipes[index].name}',
//                             style: TextStyle(
//                               fontSize: 30,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
