
import 'package:flutter/cupertino.dart';

import '../ApiHelper/Api_helper.dart';
import '../modal/api_modal.dart';

class PixabayProvider extends ChangeNotifier
{
  ApiHelper apiHelper = ApiHelper();
  PixabayModal? pixabayModal;
  String search = 'car';
  bool goToHome = false;


  void findImg(String img){
    search = img;
    notifyListeners();
  }


  Future<PixabayModal?> fromMap(String img)
  async {
    final data = await apiHelper.apiCalling(img);
    pixabayModal = PixabayModal.fromMap(data);
    return pixabayModal;
  }

  bool wallpaper()
  {
    goToHome != goToHome;
    return goToHome;

  }

}
var txtSearch = TextEditingController();

