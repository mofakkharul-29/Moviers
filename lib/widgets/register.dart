import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviers/onboarding/root_screen.dart';
import 'package:moviers/widgets/otp.dart';
import 'package:moviers/widgets/terms.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dateController =
      TextEditingController();
  bool _createButtonEnabled = false;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateCreateButtonState);
    _passwordController.addListener(
      _updateCreateButtonState,
    );
    _confirmPasswordController.addListener(
      _updateCreateButtonState,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dateController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _dateFocusNode.dispose();
    super.dispose();
  }

  void _closeKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Register',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => onSkipTap(context),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color.fromRGBO(158, 158, 158, 1),
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: _dismissKeyboard,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Create New Account',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              _buildTextFormField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_rounded,
                focusNode: _emailFocusNode,
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock_outline_rounded,
                focusNode: _passwordFocusNode,
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                prefixIcon: Icons.lock_outline_rounded,
                focusNode: _confirmPasswordFocusNode,
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _dateController,
                hintText: 'DD/MM/YYYY',
                keyboardType: TextInputType.datetime,
                prefixIcon: Icons.calendar_month,
                focusNode: _dateFocusNode,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed:
                    _createButtonEnabled
                        ? _onCreateTap
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _createButtonEnabled
                          ? const Color(0xFF1F80FF)
                          : const Color(0xFF3A3A3A),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBackgroundColor: const Color(
                    0xFF3A3A3A,
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color:
                        _createButtonEnabled
                            ? Colors.white
                            : Color.fromRGBO(
                              158,
                              158,
                              158,
                              1,
                            ),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'or',
                  style: TextStyle(
                    color: Color.fromARGB(
                      255,
                      204,
                      197,
                      197,
                    ),
                    fontSize: 14,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildSocialLoginButton(
                'Register with Apple',
                'assets/images/apple.png',
                Color.fromARGB(255, 239, 240, 243),
                () {},
              ),
              const SizedBox(height: 16),
              _buildSocialLoginButton(
                'Register with Google',
                'assets/images/google.png',
                Color.fromARGB(255, 22, 22, 22),
                () {},
                true,
              ),
              const SizedBox(height: 50),
              Center(child: TermsText()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(
    String text,
    String iconPath,
    Color color,
    VoidCallback onTap, [
    bool? isGoogle = false,
  ]) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor:
            isGoogle! ? Colors.white : Colors.black,
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(color: Color(0xFF4C586B)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 24),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }

  void _updateCreateButtonState() {
    setState(() {
      _createButtonEnabled =
          _emailController.text.isNotEmpty ||
          _passwordController.text.isNotEmpty ||
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  void _onCreateTap() {
    if (_createButtonEnabled) {
      _closeKeyboard();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OTPScreen(),
        ),
      );
    }
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    IconData? prefixIcon,
  }) {
    int length = controller.text.length;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(194, 194, 194, 1),
        ),
        filled: true,
        fillColor: Color.fromRGBO(10, 10, 10, 1),
        prefixIcon:
            prefixIcon != null
                ? Icon(
                  prefixIcon,
                  color:
                      length > 0
                          ? Colors.blue
                          : Color.fromRGBO(
                            194,
                            194,
                            194,
                            1,
                          ),
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color(0xFF1F80FF),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
    );
  }

  void _dismissKeyboard() {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _confirmPasswordFocusNode.unfocus();
    _dateFocusNode.unfocus();
  }

  void onSkipTap(BuildContext context) {
    _closeKeyboard();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RootScreen(),
      ),
    );
  }
}
