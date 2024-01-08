// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
mixin _$Memo {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get shopName => throw _privateConstructorUsedError;
  String? get itemName => throw _privateConstructorUsedError;
  String? get nominalSpiciness => throw _privateConstructorUsedError;
  Judge get judge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res, Memo>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String? shopName,
      String? itemName,
      String? nominalSpiciness,
      Judge judge});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res, $Val extends Memo>
    implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? shopName = freezed,
    Object? itemName = freezed,
    Object? nominalSpiciness = freezed,
    Object? judge = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      nominalSpiciness: freezed == nominalSpiciness
          ? _value.nominalSpiciness
          : nominalSpiciness // ignore: cast_nullable_to_non_nullable
              as String?,
      judge: null == judge
          ? _value.judge
          : judge // ignore: cast_nullable_to_non_nullable
              as Judge,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoImplCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$$MemoImplCopyWith(
          _$MemoImpl value, $Res Function(_$MemoImpl) then) =
      __$$MemoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String? shopName,
      String? itemName,
      String? nominalSpiciness,
      Judge judge});
}

/// @nodoc
class __$$MemoImplCopyWithImpl<$Res>
    extends _$MemoCopyWithImpl<$Res, _$MemoImpl>
    implements _$$MemoImplCopyWith<$Res> {
  __$$MemoImplCopyWithImpl(_$MemoImpl _value, $Res Function(_$MemoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? shopName = freezed,
    Object? itemName = freezed,
    Object? nominalSpiciness = freezed,
    Object? judge = null,
  }) {
    return _then(_$MemoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      nominalSpiciness: freezed == nominalSpiciness
          ? _value.nominalSpiciness
          : nominalSpiciness // ignore: cast_nullable_to_non_nullable
              as String?,
      judge: null == judge
          ? _value.judge
          : judge // ignore: cast_nullable_to_non_nullable
              as Judge,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoImpl with DiagnosticableTreeMixin implements _Memo {
  const _$MemoImpl(
      {required this.id,
      required this.date,
      this.shopName,
      this.itemName,
      this.nominalSpiciness,
      required this.judge});

  factory _$MemoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String? shopName;
  @override
  final String? itemName;
  @override
  final String? nominalSpiciness;
  @override
  final Judge judge;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Memo(id: $id, date: $date, shopName: $shopName, itemName: $itemName, nominalSpiciness: $nominalSpiciness, judge: $judge)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Memo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('shopName', shopName))
      ..add(DiagnosticsProperty('itemName', itemName))
      ..add(DiagnosticsProperty('nominalSpiciness', nominalSpiciness))
      ..add(DiagnosticsProperty('judge', judge));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.nominalSpiciness, nominalSpiciness) ||
                other.nominalSpiciness == nominalSpiciness) &&
            (identical(other.judge, judge) || other.judge == judge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, date, shopName, itemName, nominalSpiciness, judge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      __$$MemoImplCopyWithImpl<_$MemoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoImplToJson(
      this,
    );
  }
}

abstract class _Memo implements Memo {
  const factory _Memo(
      {required final String id,
      required final DateTime date,
      final String? shopName,
      final String? itemName,
      final String? nominalSpiciness,
      required final Judge judge}) = _$MemoImpl;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$MemoImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String? get shopName;
  @override
  String? get itemName;
  @override
  String? get nominalSpiciness;
  @override
  Judge get judge;
  @override
  @JsonKey(ignore: true)
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
