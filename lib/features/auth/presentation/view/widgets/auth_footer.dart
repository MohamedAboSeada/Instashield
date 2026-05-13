import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/link_button.dart';
import '../../../../../core/extensions/context_extensions.dart';

/// This widget used by login page to take
/// user to register page if he don't have
/// account.
class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.switchLabel,
    this.onSwitchPressed,
    required this.label,
  });
  final String switchLabel;
  final VoidCallback? onSwitchPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6.0.w,
      children: [
        Text(
          label,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        LinkButton(onTap: onSwitchPressed, label: switchLabel),
      ],
    );
  }
}
