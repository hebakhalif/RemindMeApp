import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/features/home/screens/onboarding_screen.dart';

class SplashTimerScreen extends StatefulWidget {
  const SplashTimerScreen({super.key});

  @override
  SplashTimerScreenState createState() => SplashTimerScreenState();
}

class SplashTimerScreenState extends State<SplashTimerScreen> {
  @override
  void initState() {
    super.initState();
    // الانتقال بعد 3 ثوانٍ
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingMainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Center(
        child: Lottie.asset(
          "assets/animations/dKisvfA7r1.json",
          width: 400.w,
          height: 200.h,
        ),
      ),
    );
  }
}
