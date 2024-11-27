import 'package:flutter/material.dart';

import '../storage_key.dart';
import '../storage_value_converter.dart';

@immutable
class StorageDateTimeKey extends StorageKey<DateTime> {
  const StorageDateTimeKey(super.key, super._converter);

  static String _fromDateTime(DateTime value) => value.toIso8601String();
  static DateTime _toDateTime(String value) => DateTime.parse(value);

  static const converter = StorageValueConverter(
    toValueType: _toDateTime,
    fromValueType: _fromDateTime,
  );
}
