import 'package:flutter/foundation.dart';
import 'package:karamemo/util/string_extension.dart';

import '../view_data/memo.dart';
import '../view_data/memo_type.dart';

@immutable
class CreateMemoPageState {
  const CreateMemoPageState({
    this.type = MemoType.shopAndItem,
    this.shopName,
    this.itemName,
    this.isSpicinessAvailable = false,
    this.nominalSpiciness,
    this.judge,
  });

  final MemoType type;
  final String? shopName;
  final String? itemName;
  final bool isSpicinessAvailable;
  final String? nominalSpiciness;

  final Judge? judge;

  bool get isAcceptable =>
      _isShopNameAcceptable && _isItemNameAcceptable && _isSpicinessAcceptable;

  bool get _isShopNameAcceptable => switch (type) {
        MemoType.itemOnly => true,
        MemoType.shopOnly || MemoType.shopAndItem => shopName.hasValue,
      };

  bool get _isItemNameAcceptable => switch (type) {
        MemoType.shopOnly => true,
        MemoType.itemOnly || MemoType.shopAndItem => itemName.hasValue,
      };

  bool get _isSpicinessAcceptable {
    if (!isSpicinessAvailable) {
      return true;
    } else {
      return nominalSpiciness.hasValue;
    }
  }

  CreateMemoPageState copyWith({
    MemoType? type,
    String? shopName,
    String? itemName,
    bool? isSpicinessAvailable,
    String? nominalSpiciness,
    Judge? judge,
  }) {
    return CreateMemoPageState(
      type: type ?? this.type,
      shopName: shopName ?? this.shopName,
      itemName: itemName ?? this.itemName,
      isSpicinessAvailable: isSpicinessAvailable ?? this.isSpicinessAvailable,
      nominalSpiciness: nominalSpiciness ?? this.nominalSpiciness,
      judge: judge ?? this.judge,
    );
  }
}
