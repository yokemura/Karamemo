import 'package:flutter/material.dart';
import 'package:karamemo/ui/component/atom/labels.dart';
import 'package:karamemo/ui/component/molecule/judge_icon_combo.dart';
import 'package:intl/intl.dart';

import '../../../model/view_data/memo.dart';

part 'memo_card_data_type.dart';

class MemoCard extends StatelessWidget {
  const MemoCard({
    super.key,
    required this.memo,
  });

  final Memo memo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: _LeftColumn(memo),
            ),
            const SizedBox(width: 12),
            JudgeIconCombo(memo.judge),
          ],
        ),
      ),
    );
  }
}

class _LeftColumn extends StatelessWidget {
  const _LeftColumn(this.memo);

  final Memo memo;

  @override
  Widget build(BuildContext context) {
    final type = _DataType.of(memo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateLabel(text: memo.date.displayString),
        switch (type) {
          _DataTypeFull(
            shopName: final shop,
            itemName: final item,
            nominalSpiciness: final spiciness,
          ) =>
            _DataAreaFull(
              shopName: shop,
              itemName: item,
              nominalSpiciness: spiciness,
            ),
          _DataTypeShopAndItem(shopName: final shop, itemName: final item) =>
            _DataAreaNameAndSpiciness(
              name: shop,
              nominalSpiciness: item,
            ),
          _DataTypeShopWithLevel(
            shopName: final shop,
            nominalSpiciness: final spiciness,
          ) =>
            _DataAreaNameAndSpiciness(
              name: shop,
              nominalSpiciness: spiciness,
            ),
          _DataTypeItemWithLevel(
            itemName: final item,
            nominalSpiciness: final spiciness,
          ) =>
            _DataAreaNameAndSpiciness(
              name: item,
              nominalSpiciness: spiciness,
            ),
          _DataTypeShopOnly(
            shopName: final shop,
          ) =>
            _DataAreaNameOnly(
              name: shop,
            ),
          _DataTypeItemOnly(
            itemName: final item,
          ) =>
            _DataAreaNameOnly(
              name: item,
            ),
        },
      ],
    );
  }
}

class _DataAreaFull extends StatelessWidget {
  const _DataAreaFull({
    required this.shopName,
    required this.itemName,
    required this.nominalSpiciness,
  });

  final String shopName;
  final String itemName;
  final String nominalSpiciness;

  @override
  Widget build(BuildContext context) {
    final text = '$itemName($nominalSpiciness)';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubItemLabel(text: shopName),
        const SizedBox(height: 12),
        ItemLabel(text: text),
      ],
    );
  }
}

class _DataAreaNameAndSpiciness extends StatelessWidget {
  const _DataAreaNameAndSpiciness({
    required this.name,
    required this.nominalSpiciness,
  });

  final String name;
  final String nominalSpiciness;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubItemLabel(text: name),
        const SizedBox(height: 12),
        ItemLabel(text: nominalSpiciness),
      ],
    );
  }
}

class _DataAreaNameOnly extends StatelessWidget {
  const _DataAreaNameOnly({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemLabel(text: name),
      ],
    );
  }
}

extension DisplayString on DateTime {
  String get displayString {
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    String str = outputFormat.format(this);
    return str;
  }
}