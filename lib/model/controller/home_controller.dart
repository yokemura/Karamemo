import 'package:riverpod/riverpod.dart';

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
        judge: 3,
      ),
    ];
    state = HomeStateListing(list: list);
  }
}