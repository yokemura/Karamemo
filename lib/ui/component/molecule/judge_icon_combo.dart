import 'package:flutter/cupertino.dart';
import 'package:karamemo/model/view_data/memo.dart';
import 'package:karamemo/ui/component/atom/judge_icon.dart';
import 'package:karamemo/ui/component/atom/labels.dart';

import 'judge_text.dart';

class JudgeIconCombo extends StatelessWidget {
  const JudgeIconCombo(this.judge, {super.key});

  final Judge judge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Column(
        children: [
          JudgeIcon(judge),
          const SizedBox(height: 4),
          SubIconLabel(text: judge.text),
        ],
      ),
    );
  }
}
