import 'package:flutter/cupertino.dart';

import '../../../model/view_data/memo.dart';

class JudgeIcon extends StatelessWidget {
  const JudgeIcon(this.judge, {super.key});

  final Judge judge;

  String get icon => switch (judge) {
    Judge.notSpicyAtAll => '😴',
    Judge.aBitSpicy => '😐',
    Judge.goodSpiciness => '😋',
    Judge.aBitTooHot => '🤣',
    Judge.tooHotToEat => '🥵',
  };

  @override
  Widget build(BuildContext context) {
    return Text(
      icon,
      style: const TextStyle(fontSize: 30),
    );
  }
}