import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

enum Judge {
  notSpicyAtAll(1),
  aBitSpicy(2),
  goodSpiciness(3),
  aBitTooHot(4),
  tooHotToEat(5);

  final int level;

  const Judge(this.level);
}

@freezed
class Memo with _$Memo {
  const factory Memo({
    required String id,
    required DateTime date,
    String? shopName,
    String? itemName,
    String? nominalSpiciness,
    required Judge judge,
  }) = _Memo;

  factory Memo.fromJson(Map<String, Object?> json) => _$MemoFromJson(json);
}
