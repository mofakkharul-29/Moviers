// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Pageviewgenerator extends StatefulWidget {
  final void Function(int) setIndex;
  const Pageviewgenerator({
    super.key,
    required this.setIndex,
  });

  @override
  State<Pageviewgenerator> createState() =>
      _PageviewgeneratorState();
}

class _PageviewgeneratorState
    extends State<Pageviewgenerator> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      onPageChanged: (value) {
        widget.setIndex(value);
      },
      children: [
        createPage(
          'Watch Your Best Movies in One App',
          'Unlimited access to millions of new and \nquality movies just for you',
          'assets/images/me.png',
        ),
        createPage(
          'Best Service Features',
          'The features we provide will guarantee the \nbest quality for you streaming',
          'assets/images/onboarding.png',
        ),
        createPage(
          'Enjoy a personalized experience',
          'Create a profile and select your favorite \ngenres to get started!',
          'assets/images/last.png',
        ),
      ],
    );
  }

  Widget createPage(
    String title,
    String subTitle,
    String url,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 186,
          width: 322,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 80),

        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            fontFamily: 'Helvetica Neue',
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            subTitle,
            softWrap: false,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(158, 158, 158, 1),
              fontSize: 14,
              fontFamily: 'Helvetica Neue',
            ),
          ),
        ),
      ],
    );
  }
}
