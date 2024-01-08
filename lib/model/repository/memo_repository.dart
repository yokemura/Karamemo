import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/local_data.dart';
import '../view_data/memo.dart';

final memoRepositoryProvider = Provider<MemoRepository>(
    (ref) => MemoRepository(localData: ref.read(localDataProvider)));

class MemoRepository {
  MemoRepository({
    required this.localData,
  });

  final LocalData localData;

  Future<List<Memo>> fetch() async =>
    localData.loadMemos();


  Future<void> add(Memo memo) async {
    final list = await localData.loadMemos();
    list.add(memo);
    localData.saveMemos(list);
  }

  Future<void> remove(Memo memo) async {
    final list = await localData.loadMemos();
    final index = list.indexWhere((e) => e.id == memo.id);
    if (index < 0) {
      return;
    }
    list.removeAt(index);
    localData.saveMemos(list);
  }

  Future<void> update(Memo memo) async {
    final list = await localData.loadMemos();
    final index = list.indexWhere((e) => e.id == memo.id);
    if (index < 0) {
      list.add(memo);
    } else {
      list[index] = memo;
    }
    localData.saveMemos(list);
  }
}
