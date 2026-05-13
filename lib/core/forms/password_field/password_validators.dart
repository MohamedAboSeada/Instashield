import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'password_field.dart';
import 'password_level.dart';

PasswordLevel calculatePasswordLevel(String password) {
  if (password.isEmpty) {
    return PasswordLevel.none;
  }

  int score = 0;

  if (password.length >= 8) score++;
  if (password.contains(RegExp(r'[A-Z]'))) score++;
  if (password.contains(RegExp(r'[a-z]'))) score++;
  if (password.contains(RegExp(r'[0-9]'))) score++;
  if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) score++;

  return switch (score) {
    1 => PasswordLevel.weak,
    2 => PasswordLevel.fair,
    3 || 4 => PasswordLevel.good,
    5 => PasswordLevel.strong,
    _ => PasswordLevel.none,
  };
}

abstract final class PasswordValidators {
  static FormFieldValidator<String> passwordValidator(
    PasswordFieldType type,
    ValueNotifier<PasswordLevel> level, [
    TextEditingController? controller,
  ]) => FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "Password can't be empty"),
    FormBuilderValidators.conditional(
      (_) => type == .login,
      FormBuilderValidators.password(
        minLength: 8,
        errorText: "Password should be at least 8 chars",
      ),
    ),
    FormBuilderValidators.conditional(
      (_) => type == .confirm,
      (value) {
        if (value != controller?.text) {
          return "Passwords don't match";
        }
        return null;
      },
    ),
    FormBuilderValidators.conditional(
      (value) => type == .signUp,
      (value) {
        final currentLevel = calculatePasswordLevel(value ?? '');
        if (currentLevel != PasswordLevel.good &&
            currentLevel != PasswordLevel.strong) {
          return "Password value should be at least Good or Strong";
        }
        return null;
      },
    ),
  ]);
}
