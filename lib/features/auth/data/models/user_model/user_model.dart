import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required String email,
    required String fullName,
    required int role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
