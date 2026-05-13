import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:heroicons/heroicons.dart';

import '../custom_form_field.dart';
import 'match_prefix_icon.dart';
import 'password_level.dart';
import 'password_strength_bar.dart';
import 'password_validators.dart'
    show calculatePasswordLevel, PasswordValidators;

enum PasswordFieldType { login, signUp, confirm }

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.name,
    this.hintText,
    this.label,
    required this.type,
    this.otherFieldController,
    this.formKey,
  }) : assert(
         type != PasswordFieldType.signUp || otherFieldController != null,
         'otherFieldController is required when type is signUp',
       ),
       assert(
         type != PasswordFieldType.confirm || otherFieldController != null,
         'otherFieldController is required when type is confirm',
       ),
       assert(
         type != PasswordFieldType.confirm || formKey != null,
         'formKey is required when type is confirm',
       );

  final String name;
  final PasswordFieldType type;
  final String? hintText;
  final String? label;
  final TextEditingController? otherFieldController;
  final GlobalKey<FormBuilderState>? formKey;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final _passwordLevel = ValueNotifier<PasswordLevel>(.none);
  final _isObscured = ValueNotifier<bool>(true);
  final _isMatching = ValueNotifier<bool?>(null);

  @override
  void initState() {
    super.initState();
    if (widget.type == .signUp) {
      widget.otherFieldController?.addListener(_calcPasswordLevel);
      _calcPasswordLevel();
    }
    if (widget.type == .confirm) {
      widget.otherFieldController?.addListener(_revalidate);
    }
  }

  void _revalidate() {
    final formState = widget.formKey?.currentState;
    final field = formState?.fields[widget.name];
    if (field?.value != null) {
      field?.validate();
    }

    if (widget.type == PasswordFieldType.confirm) {
      final confirmValue = formState?.fields[widget.name]?.value;
      if (confirmValue != null && confirmValue.isNotEmpty) {
        _isMatching.value = confirmValue == widget.otherFieldController?.text;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _isObscured.dispose();
    _passwordLevel.dispose();
    _isMatching.dispose();
    if (widget.type == .confirm) {
      widget.otherFieldController?.removeListener(_revalidate);
    }
    if (widget.type == .signUp) {
      widget.otherFieldController?.removeListener(_calcPasswordLevel);
    }
    super.dispose();
  }

  void _calcPasswordLevel() {
    final password = widget.otherFieldController?.text ?? '';
    _passwordLevel.value = calculatePasswordLevel(password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 8.0,
      children: [
        ValueListenableBuilder(
          valueListenable: _isObscured,
          builder: (context, value, child) {
            return CustomFormField(
              label: widget.label,
              obscureText: value,
              name: widget.name,
              hintText: widget.hintText,
              controller: widget.type == .signUp
                  ? widget.otherFieldController
                  : null,
              prefixIcon: widget.type == .confirm
                  ? MatchPrefixIcon(isMatching: _isMatching)
                  : const HeroIcon(.lockClosed),
              suffixIcons: IconButton(
                onPressed: () => _isObscured.value = !value,
                icon: HeroIcon(
                  value ? .eye : .eyeSlash,
                  semanticLabel: value ? "Revel password" : "Hide password",
                ),
              ),
              validator: PasswordValidators.passwordValidator(
                widget.type,
                _passwordLevel,
                widget.otherFieldController,
              ),
              onChanged: widget.type == .confirm
                  ? (value) {
                      if (value != null && value.isNotEmpty) {
                        _isMatching.value =
                            value == widget.otherFieldController?.text;
                      } else {
                        _isMatching.value = null;
                      }
                    }
                  : null,
            );
          },
        ),

        if (widget.type == .signUp)
          ValueListenableBuilder(
            valueListenable: _passwordLevel,
            builder: (context, value, child) {
              return PasswordStrengthBar(level: value);
            },
          ),
      ],
    );
  }
}
