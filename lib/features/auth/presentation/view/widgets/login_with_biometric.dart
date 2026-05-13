import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/strings/app_strings.dart';

enum EnabledBiometricType { faceId, fingerPrint }

/// This widget is a button i used to perform biometric login
/// if enabled so i provide enabled param to ensure that if
/// the biometrics not enabled is should be disabled.
///
/// this widget support two type of biometrics "FaceID, Fingerprint".
class LoginWithBiometric extends StatelessWidget {
  const LoginWithBiometric({
    super.key,
    required this.onPressed,
    required this.type,
    this.enabled = true,
  });

  final bool enabled;
  final VoidCallback? onPressed;
  final EnabledBiometricType type;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: enabled ? onPressed : null,
      style: FilledButton.styleFrom(
        fixedSize: Size.fromHeight(56.0.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0.r),
        ),
        textStyle: context.textTheme.labelLarge?.copyWith(fontSize: 16.0),
        iconSize: 24.0.r,
      ),
      icon: enabled
          ? type != EnabledBiometricType.faceId
                ? const HeroIcon(HeroIcons.fingerPrint)
                : SvgPicture.asset(AppAssets.faceIdIcon, width: 24.0.w)
          : const HeroIcon(HeroIcons.fingerPrint),
      label: enabled
          ? Text(type == EnabledBiometricType.faceId ? "FaceID" : "Fingerprint")
          : const Text("Biometric login disabled"),
    );
  }
}
