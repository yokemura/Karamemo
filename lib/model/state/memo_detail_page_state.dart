
import 'package:flutter/cupertino.dart';

import '../view_data/memo.dart';

@immutable
class MemoDetailPageState {
  const MemoDetailPageState({
    required this.memo,
    this.relatedMemo = const [],
    this.deleteCompleted = false,
  });

  final Memo memo;
  final List<Memo> relatedMemo;
  final bool deleteCompleted;

  MemoDetailPageState copyWith({
    Memo? memo,
    List<Memo>? relatedMemo,
    bool? deleteCompleted,
  }) {
    return MemoDetailPageState(
      memo: memo ?? this.memo,
      relatedMemo: relatedMemo ?? this.relatedMemo,
      deleteCompleted: deleteCompleted ?? this.deleteCompleted,
    );
  }
}