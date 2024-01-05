import '../view_data/memo.dart';

sealed class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateListing extends HomeState {
  List<Memo> list;

  HomeStateListing({
    required this.list,
  });
}
