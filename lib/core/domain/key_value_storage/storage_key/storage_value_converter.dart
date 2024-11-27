class StorageValueConverter<ValueType> {
  final ValueType Function(String value) toValueType;
  final String Function(ValueType value) fromValueType;

  const StorageValueConverter({
    required this.toValueType,
    required this.fromValueType,
  });
}
