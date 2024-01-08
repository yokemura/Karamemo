import 'package:flutter/cupertino.dart';
import 'package:karamemo/ui/component/molecule/judge_text.dart';
import 'package:karamemo/ui/component/molecule/memo_detail_data_line.dart';

import '../../../model/view_data/memo.dart';

class MemoDetailCombo extends StatelessWidget {
  const MemoDetailCombo(this.memo, {super.key});

  final Memo memo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (memo.shopName != null) ...[
          MemoDetailDataLine('店名', memo.shopName!),
          const SizedBox(height: 12),
        ],
        if (memo.itemName != null) ...[
          MemoDetailDataLine('メニュー／商品名', memo.itemName!),
          const SizedBox(height: 12),
        ],
        if (memo.nominalSpiciness != null) ...[
          MemoDetailDataLine('辛さレベル', memo.nominalSpiciness!),
          const SizedBox(height: 12),
        ],
        MemoDetailDataLine('評価', memo.judge.emoji + memo.judge.text)
      ],
    );
  }
}
