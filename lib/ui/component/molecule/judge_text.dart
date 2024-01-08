import '../../../model/view_data/memo.dart';

extension JudgeText on Judge {
  String get text => switch (this) {
    Judge.notSpicyAtAll => '辛くない',
    Judge.aBitSpicy => '辛さは感じる',
    Judge.goodSpiciness => 'ちょうどいい',
    Judge.aBitTooHot => 'ギリいける',
    Judge.tooHotToEat => '辛すぎ無理',
  };

  String get emoji => switch (this) {
    Judge.notSpicyAtAll => '😴',
    Judge.aBitSpicy => '😐',
    Judge.goodSpiciness => '😋',
    Judge.aBitTooHot => '🤣',
    Judge.tooHotToEat => '🥵',
  };
}