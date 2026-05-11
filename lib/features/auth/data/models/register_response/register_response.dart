import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

/// Response that returned when making register request.
/// it contains a message with successful user creation
/// and [userId] used through the application.
@freezed
sealed class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required String message,
    required String userId
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, Object?> json) =>
      _$RegisterResponseFromJson(json);
}
