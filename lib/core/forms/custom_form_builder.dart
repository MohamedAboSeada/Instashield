import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/context_extensions.dart';
import 'form_button.dart';

/// This widget used to create forms in auth screens
/// auth screen it gives me a uniform layout to put
/// the form fields and also add extra item if needed
/// to perform extra action (eg. forget password)
///
/// it handles validation of the form fields and if
/// all fields valid just execute the onSubmit with the
/// for fields.
class CustomFormBuilder extends StatefulWidget {
  const CustomFormBuilder({
    super.key,
    required this.fields,
    this.extra,
    required this.onSubmit,
    this.isLoading = false,
    required this.btnLabel,
  });

  final List<Widget> fields;
  final Widget? extra;
  final void Function(Map<String, Object?> formState) onSubmit;
  final bool isLoading;
  final String btnLabel;

  @override
  State<CustomFormBuilder> createState() => _CustomFormBuilderState();
}

class _CustomFormBuilderState extends State<CustomFormBuilder> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _submit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final state = _formKey.currentState!.value;
      widget.onSubmit(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: .onUserInteractionIfError,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(24.0.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colorScheme.outline.withValues(alpha: 0.2),
              ),
              color: context.colorScheme.surfaceContainer.withValues(
                alpha: 0.5,
              ),
              borderRadius: BorderRadius.circular(24.0.r),
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary.withValues(alpha: 0.2),
                  context.colorScheme.primary.withValues(alpha: 0.1),
                ],
                begin: .topLeft,
                end: .bottomRight,
              ),
            ),
            child: Column(
              spacing: 20.0.h,
              children: [
                ...widget.fields,
                if (widget.extra != null)
                  Align(alignment: Alignment.topRight, child: widget.extra!),
              ],
            ),
          ),
          32.0.verticalSpace,
          FormButton(
            onPressed: _submit,
            label: widget.btnLabel,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }
}
