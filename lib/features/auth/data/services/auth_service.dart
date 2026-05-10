import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/strings/app_strings.dart';
import '../auth.dart';

/// [AuthServer] interface that represents the main
/// functions that user can make in order to be
/// authenticated it contains two register methods (user, merchant)
/// and signIn method.
abstract interface class AuthService {
  Future<RegisterResponse> registerUser(RegisterParams registerParams);
  Future<RegisterResponse> registerMerchant(
    RegisterMerchantParams registerMerchantParams,
  );
  Future<AuthResponse> signIn(SignInParams signInParams);
}

/// [AuthServiceImpl] implementation class of the [AuthService] class.
class AuthServiceImpl implements AuthService {
  final Dio _dioClient;
  const AuthServiceImpl({required Dio dioClient}) : _dioClient = dioClient;

  @override
  Future<RegisterResponse> registerMerchant(
    RegisterMerchantParams registerMerchantParams,
  ) async {
    return await _performRegister(registerMerchantParams);
  }

  @override
  Future<RegisterResponse> registerUser(RegisterParams registerParams) async {
    return await _performRegister(registerParams);
  }

  @override
  Future<AuthResponse> signIn(SignInParams signInParams) async {
    try {
      final response = await _dioClient.post(
        ApiRoutes.login,
        data: signInParams.toMap(),
      );
      final data = response.data as Map<String, Object?>;
      return AuthResponse.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    } catch (e, s) {
      throw ServerException(message: e.toString(), error: e, stackTrace: s);
    }
  }

  /// Helper function that is used in any register
  /// request either from (user, merchant).
  Future<RegisterResponse> _performRegister(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await _dioClient.post(
        ApiRoutes.register,
        data: registerParams.toMap(),
      );
      final data = response.data as Map<String, Object?>;
      return RegisterResponse.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    } catch (e, s) {
      throw ServerException(message: e.toString(), error: e, stackTrace: s);
    }
  }
}
