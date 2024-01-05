part of 'memo_card.dart';

sealed class _DataType {
  static _DataType of(Memo memo) {
    final shopName = memo.shopName;
    final itemName = memo.itemName;
    final nominalSpiciness = memo.nominalSpiciness;

    if (shopName != null) {
      //
      // 1. Shop name non-null
      //
      if (itemName != null) {
        //
        // 1-1 Shop non-null, Item non-null
        //
        if (nominalSpiciness != null) {
          // 1-1-1
          return _DataTypeFull(shopName: shopName, itemName: itemName, nominalSpiciness: nominalSpiciness);
        } else {
          // 1-1-2
          return _DataTypeShopAndItem(shopName: shopName, itemName: itemName);
        }
      } else {
        //
        // 1-2 Shop non-null, Item null
        //
        if (nominalSpiciness != null) {
          // 1-2-1
          return _DataTypeShopWithLevel(shopName: shopName, nominalSpiciness: nominalSpiciness);
        } else {
          // 1-2-2
          return _DataTypeShopOnly(shopName: shopName);
        }
      }
    } else {
      //
      // 2. Shop name null
      //
      if (itemName != null) {
        //
        // 2-1 Shop null, Item non-null
        //
        if (nominalSpiciness != null) {
          // 2-1-1
          return _DataTypeItemWithLevel(itemName: itemName, nominalSpiciness: nominalSpiciness);
        } else {
          // 2-1-2
          return _DataTypeItemOnly(itemName: itemName);
        }
      } else {
        //
        // 2-2 Shop null, Item null
        //
        throw StateError('ShopとItemが両方nullはおかしい');
      }
    }
  }
}

class _DataTypeFull extends _DataType {
  final String shopName;
  final String itemName;
  final String nominalSpiciness;

  _DataTypeFull({
    required this.shopName,
    required this.itemName,
    required this.nominalSpiciness,
  });
}

class _DataTypeShopAndItem extends _DataType {
  final String shopName;
  final String itemName;

  _DataTypeShopAndItem({
    required this.shopName,
    required this.itemName,
  });
}

class _DataTypeShopWithLevel extends _DataType {
  final String shopName;
  final String nominalSpiciness;

  _DataTypeShopWithLevel({
    required this.shopName,
    required this.nominalSpiciness,
  });
}

class _DataTypeItemWithLevel extends _DataType {
  final String itemName;
  final String nominalSpiciness;

  _DataTypeItemWithLevel({
    required this.itemName,
    required this.nominalSpiciness,
  });
}

class _DataTypeShopOnly extends _DataType {
  final String shopName;

  _DataTypeShopOnly({
    required this.shopName,
  });
}

class _DataTypeItemOnly extends _DataType {
  final String itemName;

  _DataTypeItemOnly({
    required this.itemName,
  });
}
