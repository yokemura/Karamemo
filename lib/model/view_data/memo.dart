import 'package:flutter/foundation.dart';

enum Judge {
  notSpicyAtAll(1),
  aBitSpicy(2),
  goodSpiciness(3),
  aBitTooHot(4),
  tooHotToEat(5);

  final int level;

  const Judge(this.level);
}

@immutable
class Memo {
  const Memo({
    required this.date,
    this.shopName,
    this.itemName,
    this.nominalSpiciness,
    required this.judge,
  });

  final DateTime date;
  final String? shopName;
  final String? itemName;
  final String? nominalSpiciness;
  final Judge judge;
}