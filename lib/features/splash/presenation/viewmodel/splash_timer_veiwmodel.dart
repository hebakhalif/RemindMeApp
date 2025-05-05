import 'dart:async';
import 'package:flutter/material.dart';
import 'package:point_ease/features/onboarding/presentation/screens/onbording_screen.dart';

class SplashTimerVeiwmodel {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnbordingScreen()),
      );
  });
  }
}