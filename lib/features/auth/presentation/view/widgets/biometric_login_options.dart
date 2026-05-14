import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instashield_app_final/core/extensions/context_extensions.dart';
import 'package:instashield_app_final/features/auth/presentation/view/widgets/biometric_item.dart';

class BiometricLoginOptions extends StatelessWidget {
  const BiometricLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "Available biometrics (2)",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        12.0.verticalSpace,
        const BiometricItem(
          title: "Touch ID",
          subtitle: "Use your fingerprint",
        ),
        16.0.verticalSpace,
        const BiometricItem(
          title: "Face ID",
          subtitle: "Use Facial recognition",
        ),
      ],
    );
  }
}
