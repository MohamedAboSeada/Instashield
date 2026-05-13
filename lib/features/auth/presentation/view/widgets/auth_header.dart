import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/extensions/context_extensions.dart';
import 'badge_logo.dart';

/// this widget used by auth screens to make
/// a title with a BadgeLogo icon in it for demonstration
/// of the current page.
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    this.hasBadgeLogo = true,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  final bool hasBadgeLogo;
  final HeroIcon? icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: hasBadgeLogo
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (hasBadgeLogo && icon != null) BadgeLogo(icon: icon!),
        24.0.verticalSpace,
        Text(
          title,
          style: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        12.0.verticalSpace,
        Text(
          subtitle,
          textAlign: .center,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
