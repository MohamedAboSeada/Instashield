import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/context_extensions.dart';

/// This widget is a CTA button used inside auth screen
/// exactly with auth forms it provide loading mechanism
/// that ensure the button is disabled and have loading
/// indicator when sending data to the remote auth source.
class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: !isLoading ? onPressed : null,
      style: FilledButton.styleFrom(
        textStyle: context.textTheme.labelLarge?.copyWith(fontSize: 16.0),
        fixedSize: Size.fromHeight(56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        shadowColor: context.colorScheme.primary.withValues(alpha: 0.2),
        elevation: 10.0,
      ),
      child: !isLoading
          ? Text(label)
          : Row(
              spacing: 16.0.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: context.colorScheme.onSurface,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 4,
                  constraints: BoxConstraints.tightFor(
                    width: 18.0.w,
                    height: 18.0.h,
                  ),
                ),
                Text(label),
              ],
            ),
    );
  }
}
