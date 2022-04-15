import 'package:equatable/equatable.dart';

abstract class FavouratesEvent extends Equatable{

}
class FavouratesButtonPressed extends FavouratesEvent{
  @override
String celebrity_Id;

  @override
  String toString() {
    return 'FavouratesButtonPressed{celebrity_Id: $celebrity_Id}';
  }

  FavouratesButtonPressed({ required this.celebrity_Id});

  List<Object?> get props => [celebrity_Id];

}
class CelebrityEvent extends FavouratesEvent{
  int page;

  @override
  String toString() {
    return 'CelebrityEvent{page: $page}';
  }

  CelebrityEvent({ required this.page});

  @override
  // TODO: implement props
  List<Object?> get props => [page];

}
class SearchEvent extends FavouratesEvent{
  String serchQuery;

  SearchEvent({ required this.serchQuery});

  @override
  // TODO: implement props
  List<Object?> get props => [throw UnimplementedError()];
}