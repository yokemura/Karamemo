import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_state.dart';
import '../view_data/memo.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) => HomeController());

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeStateInitial());

  void getMemo() async {
    final list = [
      // full
      Memo(
        date: DateTime.now(),
        shopName: 'ビール天国',
        itemName: '辛さが選べるチキン',
        nominalSpiciness: '激辛',
        judge: Judge.goodSpiciness,
      ),
      // shop with level
      Memo(
        date: DateTime.now(),
        shopName: 'マジックスパイス',
        nominalSpiciness: '天空',
        judge: Judge.tooHotToEat,
      ),
      // item with level
      Memo(
        date: DateTime.now(),
        itemName: 'まるマート 選べるまるチキン',
        nominalSpiciness: '激辛',
        judge: Judge.aBitSpicy,
      ),
      // shop only
      Memo(
        date: DateTime.now(),
        shopName: 'メニューが一種類の店',
        judge: Judge.goodSpiciness,
      ),
      // shop only
      Memo(
        date: DateTime.now(),
        itemName: 'かくマート 激辛チキン',
        judge: Judge.notSpicyAtAll,
      ),
      // shop and item
      Memo(
        date: DateTime.now(),
        shopName: 'ビール天国',
        itemName: '激辛スンドゥブ',
        judge: Judge.aBitTooHot,
      ),
    ];
    await Future.delayed(const Duration(seconds: 1));
    state = HomeStateListing(list: list);
  }
}
