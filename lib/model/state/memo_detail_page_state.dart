import 'package:flutter/cupertino.dart';

import '../view_data/memo.dart';

@immutable
class MemoDetailPageState {
  const MemoDetailPageState({
    this.memo,
    this.relatedMemo = const [],
    this.shouldGoBack = false,
  });

  final Memo? memo;
  final List<Memo> relatedMemo;
  final bool shouldGoBack;

  MemoDetailPageState copyWith({
    Memo? memo,
    List<Memo>? relatedMemo,
    bool? shouldGoBack,
  }) {
    return MemoDetailPageState(
      memo: memo ?? this.memo,
      relatedMemo: relatedMemo ?? this.relatedMemo,
      shouldGoBack: shouldGoBack ?? this.shouldGoBack,
    );
  }
}
