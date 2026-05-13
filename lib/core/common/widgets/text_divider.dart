import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';

/// This widget is a divider that contains a text
/// splitting it in a half 😜😜.
class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
