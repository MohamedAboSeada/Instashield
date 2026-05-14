import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_check_box_tile.dart';

class ChooseAccountTypeRadioGroup extends StatefulWidget {
  const ChooseAccountTypeRadioGroup({super.key, required this.name});
  final String name;

  @override
  State<ChooseAccountTypeRadioGroup> createState() =>
      _ChooseAccountTypeRadioGroupState();
}

class _ChooseAccountTypeRadioGroupState
    extends State<ChooseAccountTypeRadioGroup> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<int>(
      name: widget.name,
      builder: (state) => RadioGroup<int>(
        groupValue: _selectedValue,
        onChanged: (int? type) {
          setState(() {
            state.didChange(type);
            _selectedValue = type!;
          });
        },
        child: Column(
          spacing: 24.0.h,
          children: [
            CustomCheckBoxTile(
              title: "Personal Account",
              subtitle: "Send, receive, manage your bank accounts with ease.",
              icon: .user,
              value: 0,
              selectedValue: _selectedValue,
            ),
            CustomCheckBoxTile(
              title: "Merchant Account",
              subtitle: "Send, receive, accept payment using fingerprint.",
              icon: .buildingStorefront,
              value: 1,
              selectedValue: _selectedValue,
            ),
          ],
        ),
      ),
    );
  }
}
