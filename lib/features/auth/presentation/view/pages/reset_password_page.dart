import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:instashield_app_final/core/extensions/context_extensions.dart';
import '../../../../../core/forms/password_field/password_field.dart';
import '../../../../../core/router/app_routes.dart';
import '../layouts/auth_layout.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _createPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _createPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: "Reset Password",
      subtitle:
          "Your new password should be different from previous used passwords.",
      icon: HeroIcon(.key, size: 32.0.r),
      fields: [
        PasswordField(
          name: "create_password",
          label: "Create Password",
          type: .signUp,
          otherFieldController: _createPasswordController,
          hintText: "Create strong password",
        ),
        PasswordField(
          name: "confirm_password",
          label: "Confirm Password",
          type: .confirm,
          otherFieldController: _createPasswordController,
          hintText: "Confirm password",
        ),
      ],
      onSubmit: (state) {
        context.go(AppRoutes.resetSuccess);
      },
      btnLabel: "Reset Password",
      formExtra: Text(
        "Both passwords must match",
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
