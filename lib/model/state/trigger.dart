import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

@immutable
class Trigger<T> {
  const Trigger(this._internalValue) : uuid = const Uuid();

  final T? _internalValue;
  final Uuid uuid;

  T? get value => _internalValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trigger &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}