import 'package:flutter/material.dart';
import 'package:hse_expo_check/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HSE Expo Check',
      theme: ThemeData(
        primaryColor: const Color(0xff0E8C87),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
