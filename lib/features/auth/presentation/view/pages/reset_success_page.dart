import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/forms/form_button.dart';
import '../../../../../core/router/app_routes.dart';
import '../widgets/auth_header.dart';

class ResetSuccessPage extends StatelessWidget {
  const ResetSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisAlignment: .center,
          children: [
            AuthHeader(
              title: "Password Updated",
              subtitle:
                  "Your password has been changed successfully, Use your new password to login to your account.",
              icon: HeroIcon(.checkBadge, size: 32.0.r),
            ),
            40.0.verticalSpace,
            FormButton(
              label: "Back to login",
              onPressed: () => context.go(AppRoutes.loginPath),
            ),
          ],
        ),
      ),
    );
  }
}
