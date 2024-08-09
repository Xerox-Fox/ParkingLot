import 'package:flutter/material.dart';

import 'package:onboarding_screen_app/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(
            6,
            64,
            43,
            1,
          ),
        ),
        useMaterial3: true,
      ),
      home: OnboardingPage(),
    );
  }
}
