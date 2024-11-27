import 'dart:async';

import 'key_list/storage_int_key.dart';
import 'key_list/storage_string_key.dart';
import 'storage_value_converter.dart';

abstract class StorageKey<ValueType> {
  final String id;

  final StorageValueConverter<ValueType> _converter;

  FutureOr<ValueType?> convertFromStorage(String? storageResult) {
    if (storageResult == null) return null;
    return _converter.toValueType(storageResult);
  }

  FutureOr<String?> convertToStorage(ValueType? value) {
    if (value == null) return null;
    return _converter.fromValueType(value);
  }

  const StorageKey(this.id, this._converter);

  static const localState =
      StorageIntKey('localState', StorageIntKey.converter);
  static const accessToken =
      StorageStringKey('accessToken', StorageStringKey.converter);
  static const refreshToken =
      StorageStringKey('refreshToken', StorageStringKey.converter);
  static const secretDatabaseKey =
      StorageStringKey('secretDatabaseKey', StorageStringKey.converter);
}
