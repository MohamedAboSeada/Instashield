import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/utils/url_launch.dart';

/// This widget used inside the register page only
/// to inform user if he continue register he then accept
/// the terms and policy and provide some clickable links
/// to our website that contain "Term of Service" & "Privacy Policy"
class PolicyTerms extends StatefulWidget {
  const PolicyTerms({super.key});

  @override
  State<PolicyTerms> createState() => _PolicyTermsState();
}

class _PolicyTermsState extends State<PolicyTerms> {
  final _onTermsTap = TapGestureRecognizer();
  final _onPolicyTap = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _onTermsTap.onTap = () async {
      final res = await launchUrlLink(
        "https://insta-shield-landing-page.vercel.app/terms",
      );
      res.fold((failure) {
        debugPrint(failure.toString());
      }, (_) {});
    };
    _onPolicyTap.onTap = () async {
      final res = await launchUrlLink(
        "https://insta-shield-landing-page.vercel.app/privacy",
      );
      res.fold((failure) {
        debugPrint(failure.toString());
      }, (_) {});
    };
  }

  @override
  void dispose() {
    _onTermsTap.dispose();
    _onPolicyTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final linkStyle = context.textTheme.labelLarge?.copyWith(
      color: context.colorScheme.primary,
      decoration: TextDecoration.underline,
      decorationColor: context.colorScheme.primary,
    );
    return SizedBox(
      width: 0.75.sw,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            height: 1.8,
          ),
          children: [
            const TextSpan(text: "By Continuing, you agree to our "),
            TextSpan(
              text: "Terms of Service",
              style: linkStyle,
              recognizer: _onTermsTap,
            ),
            const TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: linkStyle,
              recognizer: _onPolicyTap,
            ),
            const TextSpan(text: "."),
          ],
        ),
      ),
    );
  }
}
