import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../auth.dart';

/// [AuthRepo] represents the intermediate connector between
/// data layer and presentation layer used by ViewModel to preform
/// auth operation so that View Model never interact directly with
/// the data source this help make concerns separated.
abstract interface class AuthRepo {
  Future<Either<Fail<String>, RegisterResponse>> registerUser(
    RegisterParams registerParams,
  );
  Future<Either<Fail<String>, RegisterResponse>> registerMerchant(
    RegisterMerchantParams registerMerchantParams,
  );
  Future<Either<Fail<String>, AuthResponse>> signIn(SignInParams signInParams);
}

/// [AuthRepoImpl] implementation class of the [AuthRepo] class.
class AuthRepoImpl implements AuthRepo {
  final AuthService _authService;

  AuthRepoImpl({required AuthService authService}) : _authService = authService;

  @override
  Future<Either<Fail<String>, RegisterResponse>> registerMerchant(
    RegisterMerchantParams registerMerchantParams,
  ) async {
    try {
      final res = await _authService.registerMerchant(registerMerchantParams);
      return right(res);
    } on ServerException catch (e) {
      return left(Fail(e.message));
    }
  }

  @override
  Future<Either<Fail<String>, RegisterResponse>> registerUser(
    RegisterParams registerParams,
  ) async {
    try {
      final res = await _authService.registerUser(registerParams);
      return right(res);
    } on ServerException catch (e) {
      return left(Fail(e.message));
    }
  }

  @override
  Future<Either<Fail<String>, AuthResponse>> signIn(
    SignInParams signInParams,
  ) async {
    try {
      final res = await _authService.signIn(signInParams);
      return right(res);
    } on ServerException catch (e) {
      return left(Fail(e.message));
    }
  }
}
