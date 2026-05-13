import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heroicons/heroicons.dart';

import 'custom_form_field.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.label,
    required this.name,
    required this.hint,
  });
  final String label;
  final String name;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label: label,
      name: name,
      hintText: hint,
      prefixIcon: const HeroIcon(HeroIcons.phone),
      autoFillHints: const [AutofillHints.telephoneNumber],
      keyboardType: TextInputType.phone,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Phone number is required "),
        FormBuilderValidators.phoneNumber(
          regex: RegExp(r'^01[0125][0-9]{8}$'),
          errorText: "Invalid Egyptian phone number",
        ),
      ]),
    );
  }
}
