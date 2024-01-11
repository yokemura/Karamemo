import 'memo.dart';
import 'memo_type.dart';

enum CreateMemoPageMode {
  scratch,
  reedit,
  editCopy,
}

class CreateMemoPageParameter {
  CreateMemoPageParameter({
    required this.mode,
    required this.memoType,
    this.originalMemo,
  });

  CreateMemoPageMode mode;
  MemoType memoType;
  Memo? originalMemo;
}
