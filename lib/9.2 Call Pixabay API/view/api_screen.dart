import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/provider.dart';
import '../modal/api_modal.dart';

class PixabayApi extends StatelessWidget {
  const PixabayApi({super.key});

  @override
  Widget build(BuildContext context) {
    PixabayProvider pixabayProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.account_circle_outlined,
          size: 30,
        ),
        scrolledUnderElevation: 0.1,
        title: TextField(
          onChanged: (value) {
            pixabayProvider.findImg(value);
          },
          controller: txtSearch,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
              },
              child: const Icon(Icons.close),
            ),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search Images',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
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
      body: FutureBuilder(
        future: Provider.of<PixabayProvider>(context, listen: false)
            .fromMap(pixabayProvider.search),
        builder: (context, snapshot) {
          PixabayModal? apiModal = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: pixabayProvider.pixabayModal!.hits.length,
                itemBuilder: (context, index) => Container(
                  height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(apiModal!.hits[index].webformatURL),
                    ),
                  ),
                  child: Text('${apiModal.hits[index].likes}'),
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