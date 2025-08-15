// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviers/onboarding/root_screen.dart';
import 'package:moviers/widgets/register.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  bool _loginButtonEnabled = false;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateLoginButtonState);
    _passwordController.addListener(
      _updateLoginButtonState,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _updateLoginButtonState() {
    setState(() {
      _loginButtonEnabled =
          _emailController.text.isNotEmpty ||
          _passwordController.text.isNotEmpty;
    });
  }

  void _onLoginTap() {
    if (_loginButtonEnabled) {
      _closeKeyboard();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RootScreen(),
        ),
      );
    }
  }

  void _onSkipTap() {
    _closeKeyboard();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RootScreen(),
      ),
    );
  }

  void _closeKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  void _dismissKeyboard() {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: _onSkipTap,
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 15,
                ),
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
          ).add(
            EdgeInsets.only(
              top: AppBar().preferredSize.height + 20,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Welcome to Moviers',
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
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed:
                    _loginButtonEnabled
                        ? _onLoginTap
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _loginButtonEnabled
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
                  'Login',
                  style: TextStyle(
                    color:
                        _loginButtonEnabled
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
                'Login with Apple',
                'assets/images/apple.png',
                Color.fromARGB(255, 239, 240, 243),
                () {},
              ),
              const SizedBox(height: 16),
              _buildSocialLoginButton(
                'Login with Google',
                'assets/images/google.png',
                Color.fromARGB(255, 22, 22, 22),
                () {},
                true,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 14,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      _closeKeyboard();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF1F80FF),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Helvetica Neue',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
}
