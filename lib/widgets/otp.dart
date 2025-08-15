import 'package:flutter/material.dart';
import 'package:moviers/widgets/personalized.dart';
import 'package:moviers/widgets/terms.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _otpFocusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );
  bool _isVerifyButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _otpControllers) {
      controller.addListener(_updateVerifyButtonState);
    }
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _updateVerifyButtonState() {
    setState(() {
      _isVerifyButtonEnabled = _otpControllers.every(
        (controller) => controller.text.length == 1,
      );
    });
  }

  void _onVerifyTap() {
    if (_isVerifyButtonEnabled) {
      FocusScope.of(context).unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Personalized(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 10, 10, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'OTP Verification',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Code is sent to +1 412 **** ***31',
              style: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    controller: _otpControllers[index],
                    focusNode: _otpFocusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    cursorColor: Color(0xFF1F80FF),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        borderSide: const BorderSide(
                          color: Color(0xFF1F80FF),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        _otpFocusNodes[index + 1]
                            .requestFocus();
                      }
                      if (value.isEmpty && index > 0) {
                        _otpFocusNodes[index - 1]
                            .requestFocus();
                      }
                      _updateVerifyButtonState();
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 60),
            TermsText(),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed:
                  _isVerifyButtonEnabled
                      ? _onVerifyTap
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isVerifyButtonEnabled
                        ? const Color(0xFF1F80FF)
                        : const Color(0xFF3A3A3A),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width - 50,
                  25,
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
