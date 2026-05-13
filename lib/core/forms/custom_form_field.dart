import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../extensions/context_extensions.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.name,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcons,
    this.controller,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType,
    this.autoFillHints,
  });

  final String? label;
  final String name;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcons;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String?>? onChanged;
  final TextInputType? keyboardType;
  final List<String>? autoFillHints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label case final label?)
          Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        FormBuilderTextField(
          name: name,
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          autofillHints: autoFillHints,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcons,
          ),
        ),
      ],
    );
  }
}
