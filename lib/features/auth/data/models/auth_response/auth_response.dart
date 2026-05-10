import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_model/user_model.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

/// response data that returned when making
/// login request it contains jwt token and it's
/// expiry date with some profile information about
/// the current user.
@freezed
sealed class AuthResponse with _$AuthResponse {
  const AuthResponse._();

  const factory AuthResponse({
    required String token,
    required DateTime expiresAt,
    required String email,
    required String fullName,
    required int role,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, Object?> json) =>
      _$AuthResponseFromJson(json);
  
  UserModel toUserModel() => UserModel(email: email, fullName: fullName, role: role);
}
