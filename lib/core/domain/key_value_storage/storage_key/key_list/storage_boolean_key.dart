import 'package:flutter/material.dart';

import '../storage_key.dart';
import '../storage_value_converter.dart';

@immutable
class StorageBoolKey extends StorageKey<bool> {
  const StorageBoolKey(super.key, super.converter);

  static String _fromValue(bool value) => value.toString();

  static const converter = StorageValueConverter<bool>(
    toValueType: _toValue,
    fromValueType: _fromValue,
  );

  static bool _toValue(value) => value.toLowerCase() == 'true';
}
