import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  final void Function()? onPrivacyTap;
  final void Function()? onTermsTap;

  const TermsText({
    super.key,
    this.onPrivacyTap,
    this.onTermsTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          color: Color(0xFF9E9E9E),
          fontFamily: 'Helvetica Neue',
          fontSize: 14,
        ),
        children: <TextSpan>[
          const TextSpan(
            text:
                "By creating an account, you agree to our's\n",
          ),
          TextSpan(
            text: "Privacy Policy",
            style: const TextStyle(
              color: Color(0xFF1F80FF),
              fontWeight: FontWeight.bold,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = onPrivacyTap,
          ),
          const TextSpan(text: " and "),
          TextSpan(
            text: "Terms of Usage",
            style: const TextStyle(
              color: Color(0xFF1F80FF),
              fontWeight: FontWeight.bold,
            ),
            recognizer:
                TapGestureRecognizer()..onTap = onTermsTap,
          ),
        ],
      ),
    );
  }
}
