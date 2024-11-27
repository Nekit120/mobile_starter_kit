import 'package:flutter/material.dart';

import '../storage_key.dart';
import '../storage_value_converter.dart';

@immutable
class StorageIntKey extends StorageKey<int> {
  const StorageIntKey(super.key, super.converter);

  static String _fromInt(int value) => value.toString();

  static const converter = StorageValueConverter(
    toValueType: int.parse,
    fromValueType: _fromInt,
  );
}
