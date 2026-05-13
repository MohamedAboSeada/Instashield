import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/extensions/context_extensions.dart';

/// This widget used to show a logo inside a styled gradient
/// badge to give a feel of premium and give a good look.
class BadgeLogo extends StatelessWidget {
  const BadgeLogo({super.key, required this.icon});
  final HeroIcon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.w,
      height: 80.0.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0.r),
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.2),
        ),
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary.withValues(alpha: 0.5),
            context.colorScheme.primary.withValues(alpha: 0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.2),
            offset: const Offset(0, 5),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: icon,
    );
  }
}
