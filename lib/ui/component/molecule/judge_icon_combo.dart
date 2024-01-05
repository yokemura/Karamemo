import 'package:flutter/cupertino.dart';
import 'package:karamemo/model/view_data/memo.dart';
import 'package:karamemo/ui/component/atom/judge_icon.dart';
import 'package:karamemo/ui/component/atom/labels.dart';

class JudgeIconCombo extends StatelessWidget {
  const JudgeIconCombo(this.judge, {super.key});

  final Judge judge;

  String get text => switch (judge) {
        Judge.notSpicyAtAll => '辛くない',
        Judge.aBitSpicy => '辛さは感じる',
        Judge.goodSpiciness => 'ちょうどいい',
        Judge.aBitTooHot => 'ギリいける',
        Judge.tooHotToEat => '辛すぎ無理',
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JudgeIcon(judge),
        const SizedBox(height: 4),
        SubIconLabel(text: text),
      ],
    );
  }
}
