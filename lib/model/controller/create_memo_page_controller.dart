import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/repository/memo_repository.dart';
import 'package:karamemo/model/state/create_memo_page_state.dart';
import 'package:uuid/uuid.dart';

import '../view_data/memo.dart';
import '../view_data/page_parameters.dart';

final createMemoPageControllerProvider = StateNotifierProvider.autoDispose
    .family<CreateMemoPageController, CreateMemoPageState,
        CreateMemoPageParameter>(
  (ref, parameter) => CreateMemoPageController(
    repository: ref.read(memoRepositoryProvider),
    parameter: parameter,
  ),
);

class CreateMemoPageController extends StateNotifier<CreateMemoPageState> {
  CreateMemoPageController({
    required this.repository,
    required this.parameter,
  }) : super(parameter.originalMemo == null
            ? CreateMemoPageState(type: parameter.memoType)
            : CreateMemoPageState.withOriginalMemo(parameter.originalMemo!));

  final MemoRepository repository;
  final CreateMemoPageParameter parameter;

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

  Future<Memo> saveMemo() async {
    final original = state.originalMemo;
    final id = original == null ? const Uuid().v4() : original.id;

    final memo = Memo(
      id: id,
      date: DateTime.now(),
      shopName: state.shopName,
      itemName: state.itemName,
      nominalSpiciness: state.nominalSpiciness,
      judge: state.judge!,
    );
    await repository.update(memo);
    return memo;
  }
}
