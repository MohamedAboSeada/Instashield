import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heroicons/heroicons.dart';

import 'custom_form_field.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    super.key,
    required this.name,
    required this.label,
    required this.hint,
  });
  final String name;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label: label,
      name: name,
      hintText: hint,
      autoFillHints: const [AutofillHints.name],
      prefixIcon: const HeroIcon(HeroIcons.userCircle),
      keyboardType: TextInputType.name,
      validator: FormBuilderValidators.required(
        errorText: "Full name is required",
      ),
    );
  }
}
