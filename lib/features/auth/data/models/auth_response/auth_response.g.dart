// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      token: json['token'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      role: (json['role'] as num).toInt(),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'email': instance.email,
      'fullName': instance.fullName,
      'role': instance.role,
    };
