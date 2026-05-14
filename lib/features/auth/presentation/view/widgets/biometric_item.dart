import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instashield_app_final/core/extensions/context_extensions.dart';

class BiometricItem extends StatelessWidget {
  const BiometricItem({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: false,
      onChanged: (value) {},
      tileColor: context.colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(borderRadius: .circular(12.0.r)),
      contentPadding: .symmetric(horizontal: 16.0.w),
      visualDensity: const VisualDensity(vertical: 4.0),
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
          color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
