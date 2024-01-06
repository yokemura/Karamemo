import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_data/memo.dart';

final memoRepositoryProvider =
    Provider<MemoRepository>((ref) => MemoRepository());

class MemoRepository {
  final List<Memo> _list = [];

  Future<List<Memo>> fetch() async {
    return _list;
  }

  Future<void> add(Memo memo) async {
    _list.add(memo);
  }

  Future<void> remove(Memo memo) async {
    _list.remove(memo);
  }

  Future<void> update(Memo memo) async {
    final index = _list.indexWhere((e) => e.id == memo.id);
    if (index < 0) {
      return;
    }
    _list[index] = memo;
  }
}
