import 'package:flutter/material.dart';
import 'package:moviers/onboarding/loginScreen.dart';
import 'package:moviers/onboarding/root_screen.dart';
import 'package:moviers/widgets/pageViewGenerator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int index = 0;
  bool isGetStartedPressed = false;
  bool isLoginPressed = true;

  void setNewIndex(int idx) {
    setState(() {
      index = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(
          10,
          10,
          10,
          1,
        ),
        body: Container(
          color: const Color.fromRGBO(10, 10, 10, 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: [
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromRGBO(
                        10,
                        10,
                        10,
                        1,
                      ),
                      height: 56,
                      width:
                          MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: const [
                          Text(
                            'M',
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              top: 4,
                            ),
                            child: Icon(
                              Icons.play_circle,
                              color: Color.fromRGBO(
                                41,
                                140,
                                255,
                                1,
                              ),
                              size: 20,
                            ),
                          ),

                          Text(
                            'viers',
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 29,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: TextButton(
                      onPressed: onSkipTap,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color.fromRGBO(
                            158,
                            158,
                            158,
                            1,
                          ),
                          fontFamily: 'Helvetica Neue',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 110),

              SizedBox(
                height: 350,
                child: Pageviewgenerator(
                  setIndex: setNewIndex,
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: buildPageIndicator(3, index),
              ),

              SizedBox(height: 60),

              index == 2
                  ? Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customElevetedButton(
                        'Get Started',
                        isGetStartedPressed,
                        () {
                          setState(() {
                            isGetStartedPressed = true;
                            isLoginPressed = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => RootScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(width: 30),

                      customElevetedButton(
                        'Login',
                        isLoginPressed,
                        () {
                          setState(() {
                            isLoginPressed = true;
                            isGetStartedPressed = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      Loginscreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget customElevetedButton(
    String text,
    bool isClicked,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          Colors.white,
        ),
        backgroundColor: WidgetStatePropertyAll(
          isClicked
              ? const Color.fromRGBO(41, 140, 255, 1)
              : Colors.grey,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        minimumSize: const WidgetStatePropertyAll(
          Size(150, 55),
        ),
      ),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

  void onSkipTap() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RootScreen()),
    );
  }

  Widget buildPageIndicator(
    int pageCount,
    int currentIndex,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (dotIndex) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(
            horizontal: 4.0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                currentIndex == dotIndex
                    ? Colors.blue
                    : Colors.grey,
          ),
        );
      }),
    );
  }
}
