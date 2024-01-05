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
        shopName: 'SAMA',
        nominalSpiciness: '4',
        judge: Judge.goodSpiciness,
      ),
    ];
    await Future.delayed(const Duration(seconds: 3));
    state = HomeStateListing(list: list);
  }
}
