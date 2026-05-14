import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/common/widgets/alert.dart';
import '../../../../../core/forms/form_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/biometric_login_options.dart';

class EnableBiometricsPage extends StatelessWidget {
  const EnableBiometricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Expanded(
                child: Column(
                  spacing: 40.0.h,
                  children: [
                    AuthHeader(
                      title: "Enable Biometrics",
                      subtitle:
                          "Login instantly and securely without entering your credentials every time.",
                      icon: HeroIcon(.fingerPrint, size: 32.0.r),
                    ),
                    const BiometricLoginOptions(),
                    const Alert(
                      alertVariant: .info,
                      title: 'Caution',
                      subtitle:
                          'To keep your account secure, please enable biometric login.',
                      icon: .informationCircle,
                    ),
                  ],
                ),
              ),
              FormButton(label: "Continue", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
