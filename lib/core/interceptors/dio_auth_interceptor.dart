import 'package:dio/dio.dart';

import '../session_management/session_manager.dart';

/// [DioAuthInterceptor] Used to add the JWT token
/// to on going requests if there are a valid session exists.
class DioAuthInterceptor extends Interceptor {
  final SessionManager _sessionManager;

  DioAuthInterceptor({required SessionManager sessionManager})
    : _sessionManager = sessionManager;

  /// Get the request then add jwt token to it's authentication
  /// header to make access to secured routes.
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _sessionManager.getToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    handler.next(options);
  }

  /// Sign out user automatically on any
  /// error with 401 status code
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await _sessionManager.signOut();
    }
    handler.next(err);
  }
}
