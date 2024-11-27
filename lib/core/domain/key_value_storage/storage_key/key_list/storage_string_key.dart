import 'package:flutter/material.dart';

import '../storage_key.dart';
import '../storage_value_converter.dart';

@immutable
class StorageStringKey extends StorageKey<String> {
  const StorageStringKey(super.key, super._converter);

  static String _toString(String value) => value;

  static const converter =
      StorageValueConverter(toValueType: _toString, fromValueType: _toString);
}
