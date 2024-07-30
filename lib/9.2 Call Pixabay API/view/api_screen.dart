import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/provider.dart';
import '../modal/api_modal.dart';

class PixabayApi extends StatelessWidget {
  const PixabayApi({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    PixabayProvider pixabayProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          'PixaBay Data',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                pixabayProvider.findImg(value);
              },
              controller: txtSearch,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.close),
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Images',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<PixabayProvider>(context, listen: false)
                  .fromMap(pixabayProvider.search),
              builder: (context, snapshot) {
                PixabayModal? apiModal = snapshot.data;
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: pixabayProvider.pixabayModal!.hits.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          selectImg = index;
                          Navigator.of(context).pushNamed('/apiDetail');
                        },
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  apiModal!.hits[index].webformatURL),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 28,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white,
                                            blurRadius: 25,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        '${apiModal!.hits[index].likes}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          shadows: [
                                            Shadow(
                                              color: Colors.white,
                                              blurRadius: 25,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(width: width * 0.17,),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.download_outlined,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        '${apiModal!.hits[index].downloads}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.comment_outlined,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        '${apiModal!.hits[index].comments}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(width: width * 0.17,),
                                ],
                              )),
                        ),
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
          ),
        ],
      ),
    );
  }
}

var selectImg = 0;


