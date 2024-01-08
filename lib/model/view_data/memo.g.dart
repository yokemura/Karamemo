// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoImpl _$$MemoImplFromJson(Map<String, dynamic> json) => _$MemoImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      shopName: json['shopName'] as String?,
      itemName: json['itemName'] as String?,
      nominalSpiciness: json['nominalSpiciness'] as String?,
      judge: $enumDecode(_$JudgeEnumMap, json['judge']),
    );

Map<String, dynamic> _$$MemoImplToJson(_$MemoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'shopName': instance.shopName,
      'itemName': instance.itemName,
      'nominalSpiciness': instance.nominalSpiciness,
      'judge': _$JudgeEnumMap[instance.judge]!,
    };

const _$JudgeEnumMap = {
  Judge.notSpicyAtAll: 'notSpicyAtAll',
  Judge.aBitSpicy: 'aBitSpicy',
  Judge.goodSpiciness: 'goodSpiciness',
  Judge.aBitTooHot: 'aBitTooHot',
  Judge.tooHotToEat: 'tooHotToEat',
};
