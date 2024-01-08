import 'package:flutter/cupertino.dart';
import 'package:karamemo/ui/component/molecule/judge_text.dart';

import '../../../model/view_data/memo.dart';

class JudgeIcon extends StatelessWidget {
  const JudgeIcon(this.judge, {super.key});

  final Judge judge;

  @override
  Widget build(BuildContext context) {
    return Text(
      judge.emoji,
      style: const TextStyle(fontSize: 30),
    );
  }
}