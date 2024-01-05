import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_state.dart';
import '../view_data/memo.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) => HomeController());

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeStateInitial());

  void getMemo() async {
    final list = [
      Memo(
        date: DateTime.now(),
        itemName: '辛さが選べるチキン',
        judge: Judge.goodSpiciness,
      ),
      Memo(
        date: DateTime.now(),
        shopName: 'マジックスパイス',
        itemName: '天空',
        judge: Judge.tooHotToEat,
      ),
    ];
    await Future.delayed(const Duration(seconds: 1));
    state = HomeStateListing(list: list);
  }
}
