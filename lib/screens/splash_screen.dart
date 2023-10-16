import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Text(
        "Splash Screen",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}