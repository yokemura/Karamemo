import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/state/memo_detail_page_state.dart';

import '../repository/memo_repository.dart';
import '../view_data/memo.dart';

final memoDetailPageControllerProvider = StateNotifierProvider.family<
    MemoDetailPageController, MemoDetailPageState, Memo>((ref, memo) {
  final repository = ref.read(memoRepositoryProvider);
  return MemoDetailPageController(repository: repository, memo: memo);
});

class MemoDetailPageController extends StateNotifier<MemoDetailPageState> {
  MemoDetailPageController({
    required this.repository,
    required Memo memo,
  }) : super(MemoDetailPageState(memo: memo));

  final MemoRepository repository;

  void deleteMemo() async {
    await repository.remove(state.memo);
    state = state.copyWith(deleteCompleted: true);
  }
}
