import 'package:ui_practice/api_provider.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/model/favourates.dart';

class FavouratiesRepository{

  ApiProvider _apiProvider=ApiProvider();

  Future<FavouratiesModel>getFavourates(String celebrity_Id){
    return _apiProvider.favourates(celebrity_Id);
  }
  Future<CelebrityModel>celebrityData(int pageNo){
    return _apiProvider.getCelebrityList(pageNo);
  }

}