import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import '../../../../../core/extensions/context_extensions.dart';

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.selectedValue,
  });

  final String title;
  final String subtitle;
  final HeroIcons icon;
  final int value;
  final int selectedValue;

  bool get _isSelected => selectedValue == value;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
      value: value,
      controlAffinity: .trailing,
      selected: _isSelected,
      selectedTileColor: context.colorScheme.surfaceContainerHigh,
      tileColor: context.colorScheme.surfaceContainer,
      minVerticalPadding: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12.0.r),
        side: BorderSide(
          color: _isSelected
              ? context.colorScheme.primary
              : context.colorScheme.outline.withValues(alpha: 0.2),
          width: 2.0,
        ),
      ),
      titleAlignment: .top,
      title: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          CircleAvatar(radius: 24.0.r, child: HeroIcon(icon)),
          12.0.verticalSpace,
          Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: .bold,
            ),
          ),
          8.0.verticalSpace,
        ],
      ),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
          height: 1.2,
        ),
      ),
    );
  }
}
