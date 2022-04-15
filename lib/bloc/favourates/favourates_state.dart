import 'package:equatable/equatable.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/model/favourates.dart';

abstract class FavouratesState extends Equatable{


}
class FavouratesInitialState extends FavouratesState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class FavouratesLoadingState extends FavouratesState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class FavouratesSuccessState extends FavouratesState{
  late FavouratiesModel favouratiesModel;

  FavouratesSuccessState(this.favouratiesModel);

  @override
  // TODO: implement props
  List<Object?> get props => [favouratiesModel];

}
class FavouratesFailureState extends FavouratesState{
  String errorMessage;

  FavouratesFailureState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}
class CelebritySuccessState extends FavouratesState{
  List<Info> celebrityModel;



  CelebritySuccessState({ required this.celebrityModel});

  @override
  // TODO: implement props
  List<Object?> get props => [celebrityModel];
}
class CelebrityLoadingState extends FavouratesState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}