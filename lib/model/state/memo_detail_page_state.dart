
import 'package:flutter/cupertino.dart';

import '../view_data/memo.dart';

@immutable
class MemoDetailPageState {
  const MemoDetailPageState({
    required this.memo,
    this.relatedMemo = const [],
  });

  final Memo memo;
  final List<Memo> relatedMemo;
}