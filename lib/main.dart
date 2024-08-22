import 'package:flutter/material.dart';
import 'pages/onboarding/onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Next Star App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFEF69A6),
      ),
      home: const OnboardingPage(),
    );
  }
}
