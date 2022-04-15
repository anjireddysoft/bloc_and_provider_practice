/*
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/repository/celebrity_repository.dart';

class CelebrityBloc {
  bool isLoading = false;
  CeleBrityRepository celeBrityRepository = CeleBrityRepository();
  final getData = PublishSubject<List<Info>>();

  List<Info> infoList = <Info>[];

  Stream<List<Info>> get getCelebrity => getDaa.stream;

  getClebrityDataList(int page) async {
    isLoading = true;
    CelebrityModel celebrityModel =
        await celeBrityRepository.celebrityData(page);

    if (infoList.isEmpty) {
      print("blocData${celebrityModel.info.length}");
      infoList.addAll(celebrityModel.info);
      getData.sink.add(infoList);
      isLoading = false;
    } else {
      infoList.addAll(celebrityModel.info);
      getData.sink.add(infoList);

      isLoading = false;
    }
  }
}
*/
