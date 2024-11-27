import 'json_utils.dart';
import 'model/server_exception_response.dart';
import 'model/validation_error.dart';

enum DenyReason {
  unAuth('unAuth'),
  accessDenied('access-denied');

  const DenyReason(this.code);

  final String code;
}

sealed class RestApiResult<T> {
  final int? statusCode;

  const RestApiResult({
    required this.statusCode,
  });

  const factory RestApiResult.data({
    final int? statusCode,
    required final T data,
  }) = DataRestApiResult;

  const factory RestApiResult.error({
    final int? statusCode,
    required final ValidationErrorResponse description,
  }) = ValidationRestApiResult;

  bool get isSuccess => switch (statusCode) {
        null => false,
        >= 200 && < 300 => true,
        _ => false,
      };
}

class DataRestApiResult<T> extends RestApiResult<T> {
  final T data;

  const DataRestApiResult({
    super.statusCode,
    required this.data,
  });
}

class ValidationRestApiResult<T> extends RestApiResult<T> {
  final ValidationErrorResponse description;

  const ValidationRestApiResult({
    super.statusCode,
    required this.description,
  });
}

class DeadRestApiResult<T> extends RestApiResult<T> {
  final ServerExceptionResponse description;

  const DeadRestApiResult({
    required super.statusCode,
    required this.description,
  });
}

class DeniedRestApiResult<T> extends RestApiResult<T> {
  final DenyReason reason;

  const DeniedRestApiResult({
    required super.statusCode,
    required this.reason,
  });
}

class UnknownRestApiResult<T> extends RestApiResult<T> {
  final Map<String, List<String>>? headers;
  final JsonType? json;
  final T? data;

  const UnknownRestApiResult({
    super.statusCode,
    this.headers,
    this.json,
    this.data,
  });
}
