import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_state.dart';
import '../view_data/memo.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(): super(HomeStateInitial());

  void getMemo() {
    final list = [
      Memo(
        date: DateTime.now(),
        shopName: 'SAMA',
        nominalSpiciness: '4',
        judge: Judge.goodSpiciness,
      ),
    ];
    state = HomeStateListing(list: list);
  }
}