import 'package:flutter/foundation.dart';

@immutable
class Memo {
  const Memo({
    required this.date,
    this.shopName,
    this.nominalSpiciness,
    required this.judge,
  });

  final DateTime date;
  final String? shopName;
  final String? nominalSpiciness;
  final int judge;
}