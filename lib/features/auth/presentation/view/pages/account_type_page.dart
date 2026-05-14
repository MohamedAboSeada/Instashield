import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/forms/form_button.dart';
import '../../../../../core/router/app_routes.dart';
import '../widgets/auth_header.dart';
import '../widgets/choose_account_type_radio_group.dart';

class AccountTypePage extends StatefulWidget {
  const AccountTypePage({super.key});

  @override
  State<AccountTypePage> createState() => _AccountTypePageState();
}

class _AccountTypePageState extends State<AccountTypePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24.0.r),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Expanded(
                child: Column(
                  spacing: 32.0.h,
                  children: [
                    AuthHeader(
                      icon: HeroIcon(.userGroup, size: 32.0.r),
                      title: "Choose Account Type",
                      subtitle: "How will you be using this app?",
                    ),
                    FormBuilder(
                      key: _formKey,
                      child: const ChooseAccountTypeRadioGroup(
                        name: 'account_type',
                      ),
                    ),
                  ],
                ),
              ),
              FormButton(
                label: "Continue",
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    context.go(AppRoutes.enableBiometricPath);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
