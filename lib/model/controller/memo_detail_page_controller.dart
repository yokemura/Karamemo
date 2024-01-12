import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/state/memo_detail_page_state.dart';

import '../repository/memo_repository.dart';
import '../view_data/memo.dart';

final memoDetailPageControllerProvider = StateNotifierProvider<
    MemoDetailPageController, MemoDetailPageState>((ref) {
  final repository = ref.read(memoRepositoryProvider);
  return MemoDetailPageController(repository: repository);
});

class MemoDetailPageController extends StateNotifier<MemoDetailPageState> {
  MemoDetailPageController({
    required this.repository,
  }) : super(const MemoDetailPageState());

  final MemoRepository repository;

  void deleteMemo() async {
    await repository.remove(state.memo!);
    goBack();
  }

  void reload(Memo memo) {
    state = state.copyWith(memo: memo);
  }

  void goBack() {
    state =
        state.copyWith(shouldGoBack: true);
  }
}
