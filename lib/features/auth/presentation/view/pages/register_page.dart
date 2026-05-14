import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/forms/full_name_field.dart';
import '../../../../../core/forms/password_field/password_field.dart';
import '../../../../../core/forms/phone_number_field.dart';
import '../../../../../core/router/app_routes.dart';
import '../layouts/auth_layout.dart';
import '../widgets/policy_terms.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      title: "Create Account",
      subtitle: "Join us and manage your finance smartly",
      icon: HeroIcon(.userPlus, size: 32.0.r),
      fields: [
        const FullNameField(
          name: "full_name",
          label: "Full Name",
          hint: "Mohamed Ali",
        ),
        const PhoneNumberField(
          label: "Phone Number",
          name: "phone_number",
          hint: "Enter your phone number",
        ),
        PasswordField(
          name: 'create_password',
          type: PasswordFieldType.signUp,
          hintText: "Create strong password",
          label: "Create Password",
          otherFieldController: _createPasswordController,
        ),
      ],
      onSubmit: (state) {
        context.go(AppRoutes.accountTypePath);
      },
      btnLabel: "Create Account",
      extra: [20.0.verticalSpace, const PolicyTerms()],
    );
  }
}
