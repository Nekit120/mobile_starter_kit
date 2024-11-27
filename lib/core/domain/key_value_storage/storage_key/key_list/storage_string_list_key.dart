import 'package:flutter/material.dart';

import '../storage_key.dart';
import '../storage_value_converter.dart';

@immutable
class StorageStringListKey extends StorageKey<List<String>> {
  const StorageStringListKey(super.key, super._converter);

  static String _fromStringList(List<String> value) {
    return value.join(',');
  }

  static List<String> _toStringList(String value) {
    if (value.isEmpty) return [];
    return value.split(',');
  }

  static const converter = StorageValueConverter(
    toValueType: _toStringList,
    fromValueType: _fromStringList,
  );
}
