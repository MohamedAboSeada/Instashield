import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';

/// This widget act as a button put in a link look
/// used for the links that don't need a lot of space
/// to fit.
class LinkButton extends StatelessWidget {
  const LinkButton({super.key, required this.onTap, required this.label});
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: context.colorScheme.primary,
          decoration: TextDecoration.underline,
          decorationColor: context.colorScheme.primary,
        ),
      ),
    );
  }
}
