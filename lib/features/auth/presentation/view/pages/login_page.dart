import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import '../../../../../core/common/widgets/link_button.dart';
import '../../../../../core/common/widgets/text_divider.dart';
import '../../../../../core/forms/password_field/password_field.dart';
import '../../../../../core/forms/phone_number_field.dart';
import '../../../../../core/router/app_routes.dart';
import '../layouts/auth_layout.dart';
import '../widgets/auth_footer.dart';
import '../widgets/login_with_biometric.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: "Welcome Back",
      subtitle: "Enter your details to access your account",
      icon: HeroIcon(HeroIcons.shieldCheck, size: 32.r),
      fields: const [
        PhoneNumberField(
          label: "Phone Number",
          name: "phone_number",
          hint: "01033536598",
        ),
        PasswordField(
          label: "Password",
          name: "password",
          type: PasswordFieldType.login,
          hintText: "••••••••••••",
        ),
      ],
      onSubmit: (state) {
        debugPrint(state.toString());
      },
      formExtra: LinkButton(onTap: () {}, label: "Forgot Password?"),
      btnLabel: "Submit",
      extra: [
        20.0.verticalSpace,
        const TextDivider(text: "Or Continue With"),
        20.0.verticalSpace,
        LoginWithBiometric(
          enabled: false,
          onPressed: () {},
          type: EnabledBiometricType.faceId,
        ),
        20.0.verticalSpace,
        AuthFooter(
          onSwitchPressed: () => context.push(AppRoutes.registerPath),
          label: "Don't have an account?",
          switchLabel: "Create Account",
        ),
      ],
    );
  }
}
