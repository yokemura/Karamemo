import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/repository/memo_repository.dart';
import 'package:karamemo/model/state/create_memo_page_state.dart';
import 'package:uuid/uuid.dart';

import '../view_data/memo.dart';

final createMemoPageControllerProvider = StateNotifierProvider.autoDispose
    .family<CreateMemoPageController, CreateMemoPageState, Memo>(
  (ref, memo) => CreateMemoPageController(
    repository: ref.read(memoRepositoryProvider),
    originalMemo: memo,
  ),
);

class CreateMemoPageController extends StateNotifier<CreateMemoPageState> {
  CreateMemoPageController({
    required this.repository,
    required this.originalMemo,
  }) : super(CreateMemoPageState(originalMemo: originalMemo));

  final MemoRepository repository;
  final Memo originalMemo;

  void copyValuesFromOriginalMemo() {
    state = state.copyWith(
      shopName: originalMemo.shopName,
      itemName: originalMemo.itemName,
      nominalSpiciness: originalMemo.nominalSpiciness,
      isSpicinessAvailable: originalMemo.nominalSpiciness != null,
    );
  }

  void setSpicinessAvailable(bool isAvailable) {
    state = state.copyWith(isSpicinessAvailable: isAvailable);
  }

  void onShopNameChanged(String name) {
    state = state.copyWith(shopName: name);
  }

  void onItemNameChanged(String name) {
    state = state.copyWith(itemName: name);
  }

  void onSpicinessNameChanged(String name) {
    state = state.copyWith(nominalSpiciness: name);
  }

  void onJudgeChanged(Judge? judge) {
    state = state.copyWith(judge: judge);
  }

  void saveMemo() async {
    final memo = Memo(
      memoType: originalMemo.memoType,
      id: originalMemo.id,
      date: DateTime.now(),
      shopName: state.shopName,
      itemName: state.itemName,
      nominalSpiciness: state.nominalSpiciness,
      judge: state.judge!,
    );
    await repository.update(memo);
  }
}
