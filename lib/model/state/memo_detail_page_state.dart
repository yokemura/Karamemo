
import 'package:flutter/cupertino.dart';
import 'package:karamemo/model/state/trigger.dart';

import '../view_data/memo.dart';

enum MemoDetailPageResumeEvent {
  reload,
  pop,
}

@immutable
class MemoDetailPageState {
  const MemoDetailPageState({
    required this.memo,
    this.relatedMemo = const [],
    this.resumeEvent = const Trigger<MemoDetailPageResumeEvent>(null),
  });

  final Memo memo;
  final List<Memo> relatedMemo;
  final Trigger<MemoDetailPageResumeEvent> resumeEvent;

  MemoDetailPageState copyWith({
    Memo? memo,
    List<Memo>? relatedMemo,
    Trigger<MemoDetailPageResumeEvent>? backEvent,
  }) {
    return MemoDetailPageState(
      memo: memo ?? this.memo,
      relatedMemo: relatedMemo ?? this.relatedMemo,
      resumeEvent: backEvent ?? this.resumeEvent,
    );
  }
}