import 'package:flutter/material.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/model/favourates.dart';
import 'package:ui_practice/repository/celebrity_repository.dart';
import 'package:ui_practice/repository/favouraties_repository.dart';

class CelebrityProvider extends ChangeNotifier {
  CeleBrityRepository celeBrityRepository = CeleBrityRepository();
  FavouratiesRepository favouratiesRepository = FavouratiesRepository();
  List<Info> list = [];
  bool isLoading = false;
  late CelebrityModel infoList;
  List<Info> get getInfoList => list;

  addFavourates(String userId, BuildContext context) async {
    FavouratiesModel favouratiesModel = await favouratiesRepository.getFavourates(userId);
    if (favouratiesModel.status.toString().toUpperCase().contains("SUCCESS")) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    "${favouratiesModel.message}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ))),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });

      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  searching(String search) async {
   // CelebrityModel infoList = await celeBrityRepository.celebrityData(1);
    print("search$search");
    list.clear();
    if (search.isEmpty) {
      list.addAll(infoList.info);
      isLoading = false;
      notifyListeners();
    } else {
      // List<Info> infoListData = [];
      for (Info infoData in infoList.info) {
        String fav = infoData.favs.toString();
        if (fav.isNotEmpty && fav.startsWith(search)) {
          list.add(infoData);
          isLoading = false;
          notifyListeners();
        }
      }
    }
  }

  getCelebrityDataList(
    int page,
  ) async {
    isLoading = true;
     infoList = await celeBrityRepository.celebrityData(page);

    if (list.isEmpty) {
      list.addAll(infoList.info);
      isLoading = false;
      notifyListeners();
    } else {
      list.addAll(infoList.info);
      isLoading = false;
      notifyListeners();
    }
  }
}
