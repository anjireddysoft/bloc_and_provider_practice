import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_practice/bloc/favourates/favourates_event.dart';
import 'package:ui_practice/bloc/favourates/favourates_state.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/model/favourates.dart';
import 'package:ui_practice/repository/favouraties_repository.dart';

class FavouratesBloc extends Bloc<FavouratesEvent, FavouratesState> {
  var infoList = [];
  final FavouratiesRepository favouratiesRepository;
  int count = 0;
  bool isLoading=false;
  List<Info> informationList = <Info>[];


  FavouratesBloc({required this.favouratiesRepository})
      : super(FavouratesInitialState());

  @override
  FavouratesState get initialState => FavouratesInitialState();

  @override
  Stream<FavouratesState> mapEventToState(FavouratesEvent event) async* {
    if (event is FavouratesButtonPressed) {
      yield FavouratesLoadingState();
      FavouratiesModel favouratiesModel =
          await favouratiesRepository.getFavourates(event.celebrity_Id);
      if (favouratiesModel.status
          .toString()
          .toUpperCase()
          .contains("SUCCESS")) {
        print("-----------------------------");
        if (favouratiesModel.message
            .toString()
            .contains("Added to favorites successfully.")) {
          if (event.celebrity_Id ==
              favouratiesModel.info!.celebrityId.toString()) {
            print("Added to favorites successfully.");
          }
        }
        yield FavouratesSuccessState(favouratiesModel);
      } else {
        yield FavouratesFailureState(favouratiesModel.message.toString());
      }
    } else if (event is CelebrityEvent) {
      yield CelebrityLoadingState();
      isLoading=true;
      CelebrityModel celebrityModel =
          await favouratiesRepository.celebrityData(event.page);
      isLoading=false;


        if (informationList.isEmpty) {
          informationList.addAll(celebrityModel.info);
          yield CelebritySuccessState(celebrityModel: informationList,);


        } else {
          informationList.addAll(celebrityModel.info);
          yield CelebritySuccessState(celebrityModel: informationList);


      }
    } else if (event is SearchEvent) {
      CelebrityModel celebrityModel =
          await favouratiesRepository.celebrityData(1);
      if (event.serchQuery.trim().isEmpty) {
        yield CelebritySuccessState(celebrityModel: celebrityModel.info);
      } else {
        List<Info> infoList = [];
        for (Info infoData in celebrityModel.info) {
          String fav = infoData.favs.toString();
          if (fav.isNotEmpty && fav.startsWith(event.serchQuery)) {
            infoList.add(infoData);
            yield CelebritySuccessState(celebrityModel: infoList);
          }
        }
      }
    }
  }
}
