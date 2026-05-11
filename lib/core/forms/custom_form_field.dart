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

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: .start,
      spacing: 8.0,
      mainAxisSize: .min,
      children: [
        if (label != null)
          Text(
            label!,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        FormBuilderTextField(
          name: name,
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
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
