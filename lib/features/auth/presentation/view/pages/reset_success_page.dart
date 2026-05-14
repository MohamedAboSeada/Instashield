import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/forms/form_button.dart';
import '../../../../../core/router/app_routes.dart';
import '../widgets/auth_header.dart';

class ResetSuccessPage extends StatelessWidget {
  const ResetSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24.0.r),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisAlignment: .center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AuthHeader(
                      title: "Password Updated",
                      subtitle:
                          "Your password has been changed successfully, Use your new password to login.",
                      icon: HeroIcon(.checkBadge, size: 32.0.r),
                    ),
                    32.0.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.0.w,
                        vertical: 12.0.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surfaceContainer,
                        borderRadius: .circular(12.0.r),
                        border: BoxBorder.all(
                          color: context.colorScheme.outline.withValues(
                            alpha: 0.2,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildSecurityItem(
                            HeroIcons.shieldCheck,
                            "Session Secured",
                            "For your protection you were logged out to keep your financial data safe.",
                          ),
                          const Divider(),
                          _buildSecurityItem(
                            HeroIcons.fingerPrint,
                            "Biometric disabled",
                            "You will need to re-enable Fingerprint or Face ID after your next login.",
                          ),
                          const Divider(),
                          _buildSecurityItem(
                            HeroIcons.lockClosed,
                            "End-to-end Encryption",
                            "Your bank accounts and transfers are secured with bank-grade encryption.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FormButton(
                label: "Back to login",
                onPressed: () => context.go(AppRoutes.loginPath),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityItem(HeroIcons icon, String title, String subtitle) {
    return Builder(
      builder: (context) => ListTile(
        leading: CircleAvatar(child: HeroIcon(icon)),
        titleAlignment: ListTileTitleAlignment.top,
        title: Text(
          title,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: .bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
