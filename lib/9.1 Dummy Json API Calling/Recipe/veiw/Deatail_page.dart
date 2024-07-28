import 'package:api_calling/9.1%20Dummy%20Json%20API%20Calling/Recipe/veiw/Recipe_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Recipe_provider.dart';

class Detail_Page extends StatelessWidget {
  const Detail_Page({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    RecipeProvider recipeProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
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
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * 0.3,
                width: width * 0.999,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(recipeProvider
                          .recipeModal!.recipes[selectINdex].image),
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
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
                            recipeProvider
                                .recipeModal!.recipes[selectINdex].name,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: height * 0.015,),
                          Row(
                            children: [
                              Text(
                                'Cuisine: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${recipeProvider.recipeModal!.recipes[selectINdex].cuisine}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              Text(
                                'Difficulty: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${recipeProvider.recipeModal!.recipes[selectINdex].difficulty}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: width * 0.4,),
                              Text(
                                '🕗 :${recipeProvider.recipeModal!.recipes[selectINdex].cookTimeMinutes} ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01,),
                          Divider(),
                          SizedBox(height: height * 0.01,),
                          Text('⭐⭐⭐⭐⭐',style: TextStyle(fontSize: 20),),
                          SizedBox(height: height * 0.01,),
                          Text(
                            'Ingredients:  ${recipeProvider.recipeModal!.recipes[selectINdex].ingredients.length}  ',
                            style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: height * 0.01,),
                          Text(
                            '${recipeProvider.recipeModal!.recipes[selectINdex].ingredients} ',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: height * 0.02,),
                          Text('Instructions : ',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500),),
                          SizedBox(height: height * 0.01,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: recipeProvider.recipeModal!
                                    .recipes[selectINdex].instructions.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(
                                      'Step ${index + 1} - ${recipeProvider.recipeModal!.recipes[selectINdex].instructions[index]}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
