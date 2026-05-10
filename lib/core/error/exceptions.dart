import 'package:dio/dio.dart';

/// [ServerException] is a wrapper class i use
/// handle errors through the application (eg. DioException)
class ServerException implements Exception {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  const ServerException({required this.message, this.error, this.stackTrace});

  static ServerException fromDioException(DioException e) {
    return ServerException(
      message: _handleDioException(e),
      error: e,
      stackTrace: e.stackTrace,
    );
  }

  /// Handle HTTP request/response problems that came from DioClient.
  static String _handleDioException(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionError => "Check your internet connection",
      DioExceptionType.connectionTimeout => "Connection timed out",
      DioExceptionType.sendTimeout => "Request timed out",
      DioExceptionType.receiveTimeout => "Server is taking too long to respond",
      DioExceptionType.cancel => "Request was cancelled",
      DioExceptionType.badResponse => _handleStatusCode(
        e.response?.statusCode,
        e.response?.data,
      ),
      _ => "Unexpected error occurred",
    };
  }

  /// Handle bad response exception using response status code
  /// and response data to determine what exactly happened as there are
  /// multiple errors that could happen with the same status code.
  static String _handleStatusCode(int? statusCode, dynamic data) {
    return switch (statusCode) {
      401 => "Invalid credentials",
      403 => "You don't have permission",
      404 => "Resource not found",
      400 => _handle400(data),
      500 => "Internal Server error, please try again later",
      _ => "Unexpected error occurred",
    };
  }
 
  /// Handle bad response exceptions with status code 400
  /// 1. handles when there are duplicates in the email address
  /// 2. handles when there are errors in sent form fields.
  static String _handle400(dynamic data) {
    if (data is Map && data.containsKey('errors')) {
      final errors = data['errors'] as Map;
      final firstField = errors.values.first;
      if (firstField is List && firstField.isNotEmpty) {
        return firstField.first.toString();
      }
    }

    if (data is List) {
      final codes = data.map((e) => e['code']).toList();
      if (codes.contains('DuplicateEmail') ||
          codes.contains('DuplicateUserName')) {
        return "Email\\UserName is already taken";
      }
    }
    return "Bad request";
  }
}
