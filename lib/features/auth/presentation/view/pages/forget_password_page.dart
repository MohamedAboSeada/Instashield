import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import '../../../../../core/forms/phone_number_field.dart';
import '../../../../../core/router/app_routes.dart';
import '../layouts/auth_layout.dart';
import '../widgets/auth_footer.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      isLoading: false,
      title: "Forget Password?",
      subtitle:
          "Enter your registered phone number to receive 6-digit OTP code in order to reset password.",
      icon: HeroIcon(.chatBubbleOvalLeftEllipsis, size: 32.0.r),
      fields: const [
        PhoneNumberField(
          label: "Phone Number",
          name: "phone_number",
          hint: "Enter your phone number",
        ),
      ],
      onSubmit: (state) {
        context.push(AppRoutes.resetPassword);
      },
      btnLabel: "Send OTP Code",
      extra: [
        20.0.verticalSpace,
        AuthFooter(
          switchLabel: "Login",
          label: "Remember your password?",
          onSwitchPressed: () => context.go(AppRoutes.loginPath),
        ),
      ],
    );
  }
}
