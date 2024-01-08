import 'memo.dart';
import 'memo_type.dart';

class CreateMemoPageParameter {
  CreateMemoPageParameter({
    required this.memoType,
    this.originalMemo,
  });

  MemoType memoType;
  Memo? originalMemo;
}
