import 'package:ui_practice/api_provider.dart';
import 'package:ui_practice/model/celebrity.dart';

class CeleBrityRepository{

  ApiProvider apiProvider=ApiProvider();

  Future<CelebrityModel>celebrityData(int pageNo){
    return apiProvider.getCelebrityList(pageNo);
  }
}