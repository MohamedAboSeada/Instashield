import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:instashield_app_final/core/extensions/context_extensions.dart';
import '../../../../../core/forms/custom_form_builder.dart';
import '../widgets/auth_header.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.fields,
    required this.onSubmit,
    required this.btnLabel,
    this.extra,
    this.formExtra,
  });

  final String title;
  final String subtitle;
  final HeroIcon icon;
  final List<Widget> fields;
  final Widget? formExtra;
  final void Function(Map<String, Object?>) onSubmit;
  final String btnLabel;
  final List<Widget>? extra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: (context.canPop())
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const HeroIcon(.arrowLeft),
              )
            : null,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24.0.w,
            right: 24.0.w,
            bottom: 16.0.h,
            top: context.padding.top + kToolbarHeight,
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              AuthHeader(title: title, subtitle: subtitle, icon: icon),
              32.0.verticalSpace,
              CustomFormBuilder(
                fields: fields,
                onSubmit: onSubmit,
                btnLabel: btnLabel,
              ),
              if (extra != null) ...extra!,
            ],
          ),
        ),
      ),
    );
  }
}
