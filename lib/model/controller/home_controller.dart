import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/repository/memo_repository.dart';

import '../state/home_state.dart';
import '../view_data/memo.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
    (ref) => HomeController(repository: ref.watch(memoRepositoryProvider)));

class HomeController extends StateNotifier<HomeState> {
  HomeController({
    required this.repository,
  }) : super(HomeStateInitial());

  final MemoRepository repository;

  void getMemo() async {
    /*
    final list = [
      // full
      Memo(
        id: '1',
        date: DateTime.now(),
        shopName: 'ビール天国',
        itemName: '辛さが選べるチキン',
        nominalSpiciness: '激辛',
        judge: Judge.goodSpiciness,
      ),
      // shop with level
      Memo(
        id: '2',
        date: DateTime.now(),
        shopName: 'マジックスパイス',
        nominalSpiciness: '天空',
        judge: Judge.tooHotToEat,
      ),
      // item with level
      Memo(
        id: '3',
        date: DateTime.now(),
        itemName: 'まるマート 選べるまるチキン',
        nominalSpiciness: '激辛',
        judge: Judge.aBitSpicy,
      ),
      // shop only
      Memo(
        id: '4',
        date: DateTime.now(),
        shopName: 'メニューが一種類の店',
        judge: Judge.goodSpiciness,
      ),
      // shop only
      Memo(
        id: '5',
        date: DateTime.now(),
        itemName: 'かくマート 激辛チキン',
        judge: Judge.notSpicyAtAll,
      ),
      // shop and item
      Memo(
        id: '6',
        date: DateTime.now(),
        shopName: 'ビール天国',
        itemName: '激辛スンドゥブ',
        judge: Judge.aBitTooHot,
      ),
    ];
    await Future.delayed(const Duration(seconds: 1));
     */
    final list = await repository.fetch();
    if (list.isEmpty) {
      state = HomeStateEmpty();
    } else {
      state = HomeStateListing(list: list);
    }
  }
}
