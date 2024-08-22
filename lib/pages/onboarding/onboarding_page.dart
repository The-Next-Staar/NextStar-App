import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import '../login/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _startFadeOut();
  }

  void _startFadeOut() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0;
      });

      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 2),
        child: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              'assets/images/the_next_star_pink_logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
