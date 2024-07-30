import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import '../Provider/provider.dart';
import 'api_screen.dart';

String _wallpaperFileHome = 'Unknown';

class ApiDetail extends StatelessWidget {
  const ApiDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PixabayProvider pixabayProvider = Provider.of(context);
    PixabayProvider pixabayProviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            'Detail Page',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "${pixabayProvider.pixabayModal!.hits[selectImg].webformatURL}"),
                fit: BoxFit.cover),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton.icon(
                                onPressed: () async {
                                  String result;
                                  var file = await DefaultCacheManager().getSingleFile("${pixabayProvider.pixabayModal!.hits[selectImg].webformatURL}");
                      // Platform messages may fail, so we use a try/catch PlatformException.
                                  try {
                                    result = await AsyncWallpaper.setWallpaperFromFile(
                                      filePath: file.path,
                                      wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                                      goToHome: pixabayProviderFalse.wallpaper(),
                                      toastDetails: ToastDetails.success(),
                                      errorToastDetails: ToastDetails.error(),
                                    )
                                        ? 'Wallpaper set'
                                        : 'Failed to get wallpaper.';
                                  } on PlatformException {
                                    result = 'Failed to get wallpaper.';
                                  }

                                },
                                label: Column(
                                  children: [
                                    Icon(Icons.lock,size: 20,),
                                    const Text('Lock Screen',style: TextStyle(fontSize: 12),),
                                  ],
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () async {
                                  String result;
                                  var file = await DefaultCacheManager().getSingleFile("${pixabayProvider.pixabayModal!.hits[selectImg].webformatURL}");
                      // Platform messages may fail, so we use a try/catch PlatformException.
                                  try {
                                    result = await AsyncWallpaper.setWallpaperFromFile(
                                      filePath: file.path,
                                      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                                      goToHome: pixabayProviderFalse.wallpaper(),
                                      toastDetails: ToastDetails.success(),
                                      errorToastDetails: ToastDetails.error(),
                                    )
                                        ? 'Wallpaper set'
                                        : 'Failed to get wallpaper.';
                                  } on PlatformException {
                                    result = 'Failed to get wallpaper.';
                                  }

                                },
                                label: Column(
                                  children: [
                                    Icon(Icons.phone_android_sharp,size: 20,),
                                    const Text('Home Screen',style: TextStyle(fontSize: 12),),
                                  ],
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () async {
                                  String result;
                                  var file = await DefaultCacheManager().getSingleFile("${pixabayProvider.pixabayModal!.hits[selectImg].webformatURL}");
                      // Platform messages may fail, so we use a try/catch PlatformException.
                                  try {
                                    result = await AsyncWallpaper.setWallpaperFromFile(
                                      filePath: file.path,
                                      wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                                      goToHome: pixabayProviderFalse.wallpaper(),
                                      toastDetails: ToastDetails.success(),
                                      errorToastDetails: ToastDetails.error(),
                                    )
                                        ? 'Wallpaper set'
                                        : 'Failed to get wallpaper.';
                                  } on PlatformException {
                                    result = 'Failed to get wallpaper.';
                                  }

                                },
                                label: Column(
                                  children: [
                                    Icon(CupertinoIcons.lock_circle,size: 20,),
                                    const Text('Both Screen',style: TextStyle(fontSize: 12),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height * 0.09,
                  width: width * 0.999,
                  color: Colors.black26,
                  child: Center(
                    child: Text(
                      'Set as A Wall Paper',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
