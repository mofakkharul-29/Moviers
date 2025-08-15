import 'package:flutter/material.dart';
import 'package:moviers/widgets/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Onboarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040A1A),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width:
                  MediaQuery.of(context).size.width * 0.7,
              height:
                  MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 12, 45, 87),
                    Color(0xFF040A1A),
                  ],
                  center: Alignment.topLeft,
                  radius: 1.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width:
                  MediaQuery.of(context).size.width * 0.5,
              height:
                  MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 12, 45, 87),
                    Color(0xFF040A1A),
                  ],
                  center: Alignment.bottomRight,
                  radius: 0.8,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'M',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Icon(
                          Icons.play_circle,
                          color: Color.fromRGBO(
                            41,
                            140,
                            255,
                            1,
                          ),
                          size: 26,
                        ),
                      ),
                      const Text(
                        'viers',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 37,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 32.0),
                child: Text(
                  'version 2.04.3.1',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
