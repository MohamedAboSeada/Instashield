// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  email: json['email'] as String,
  fullName: json['fullName'] as String,
  role: (json['role'] as num).toInt(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'role': instance.role,
    };
