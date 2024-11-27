import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../data/model/server_exception_response.dart';
import '../data/model/validation_error.dart';
import '../data/rest_api_result.dart';

abstract mixin class RetrofitRestApiHandler {
  @protected
  Future<RestApiResult<T>> handleExceptions<T>(
      final Object error, final StackTrace stackTrace) async {
    switch (error) {
      case DioException(:final response):
        if (response == null) return const UnknownRestApiResult();
        final Response(:statusCode, :data) = response;
        if (statusCode == null) {
          return UnknownRestApiResult(
            headers: response.headers.map,
            json: response.data,
          );
        }
        return switch (statusCode) {
          400 => ValidationRestApiResult(
              statusCode: statusCode,
              description: ValidationErrorResponse.fromJson(data)),
          401 => DeniedRestApiResult(
              statusCode: statusCode, reason: DenyReason.unAuth),
          403 => DeniedRestApiResult(
              statusCode: statusCode, reason: DenyReason.accessDenied),
          >= 500 => DeadRestApiResult(
              statusCode: statusCode,
              description: ServerExceptionResponse.fromJson(data)),
          _ => UnknownRestApiResult(
              statusCode: statusCode,
              headers: response.headers.map,
              json: response.data,
            ),
        };
      default:
        return const UnknownRestApiResult();
    }
  }

  @protected
  Future<RestApiResult<T>> request<T>(
      final Future<T> Function() callback) async {
    try {
      return RestApiResult.data(data: await callback());
    } catch (e, st) {
      log('RetrofitRestApiHandler', error: e, stackTrace: st);
      return handleExceptions(e, st);
    }
  }
}
