import 'package:flutter/cupertino.dart';
import 'package:karamemo/ui/component/atom/labels.dart';

class MemoDetailDataLine extends StatelessWidget {
  const MemoDetailDataLine(this.index, this.value, {super.key});

  final String index;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      BodyLabel(text: '$index:'),
      const SizedBox(width: 12),
      IndexLabel(text: value),
    ],
    );
  }
}