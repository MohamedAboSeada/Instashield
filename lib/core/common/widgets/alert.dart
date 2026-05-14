
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

import '../../extensions/context_extensions.dart';

enum AlertVariant { warning, error, info }

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    required this.alertVariant,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final AlertVariant alertVariant;
  final String title;
  final String subtitle;
  final HeroIcons icon;

  _AlertStyle _getStyle() => switch (alertVariant) {
    AlertVariant.info => _AlertStyle(
      tileColor: Colors.blue.shade900.withValues(alpha: 0.5),
      borderColor: Colors.blue.shade300.withValues(alpha: 0.2),
      avatarBackground: Colors.blue.shade600,
      avatarForeground: Colors.blue.shade100,
      titleColor: Colors.blue.shade400,
      subtitleColor: Colors.blue.shade200,
    ),
    AlertVariant.warning => _AlertStyle(
      tileColor: Colors.amber.shade900.withValues(alpha: 0.5),
      borderColor: Colors.amber.shade300.withValues(alpha: 0.2),
      avatarBackground: Colors.amber.shade600,
      avatarForeground: Colors.deepOrange,
      titleColor: Colors.amber.shade400,
      subtitleColor: Colors.amber.shade200,
    ),
    AlertVariant.error => _AlertStyle(
      tileColor: Colors.red.shade900.withValues(alpha: 0.5),
      borderColor: Colors.red.shade300.withValues(alpha: 0.2),
      avatarBackground: Colors.red.shade600,
      avatarForeground: Colors.red.shade100,
      titleColor: Colors.red.shade400,
      subtitleColor: Colors.red.shade200,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final style = _getStyle();

    return ListTile(
      tileColor: style.tileColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: style.borderColor),
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      minVerticalPadding: 18.0.h,
      titleAlignment: ListTileTitleAlignment.top,
      leading: CircleAvatar(
        backgroundColor: style.avatarBackground,
        foregroundColor: style.avatarForeground,
        child: HeroIcon(icon, style: HeroIconStyle.solid),
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          color: style.titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodyMedium?.copyWith(
          color: style.subtitleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _AlertStyle {
  const _AlertStyle({
    required this.tileColor,
    required this.borderColor,
    required this.avatarBackground,
    required this.avatarForeground,
    required this.titleColor,
    required this.subtitleColor,
  });

  final Color tileColor;
  final Color borderColor;
  final Color avatarBackground;
  final Color avatarForeground;
  final Color titleColor;
  final Color subtitleColor;
}
