import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hse_expo_check/screen/get_started.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundImage: Image.asset("assets/bg.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover),
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 5),
        nextScreen: const GetStartedScreen(),
        childWidget: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/bg.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff0E8C87).withOpacity(0.5),
                    const Color(0xff273D8A).withOpacity(0.5)
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo2.png", width: 500, height: 500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
