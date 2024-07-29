import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../9.2 Call Pixabay API/modal/api_modal.dart';
import '../../../Utils/Global_data.dart';
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
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          ImgList2.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.25,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(ImgList2[index]),
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
                      itemCount: recipeProvider.recipeModal!.recipes.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    selectINdex = index;
                                    Navigator.of(context).pushNamed('/Rdetail');
                                  },
                                  child: Container(
                                    height: height * 0.2,
                                    width: width * 0.45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            apiModal!.recipes[index].image),
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
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      // crossAxisAlignment: CrossAxisAlignment.,
                                      children: [
                                        Text(
                                          'Difficulty : ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          apiModal.recipes[index].difficulty,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      // crossAxisAlignment: CrossAxisAlignment.,
                                      children: [
                                        Text(
                                          'Cuisine : ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          apiModal.recipes[index].cuisine,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
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

