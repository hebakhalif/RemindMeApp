import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/features/splash/presenation/viewmodel/splash_timer_veiwmodel.dart';

class SplashTimerScreen extends StatefulWidget {
  const SplashTimerScreen({super.key});

  @override
  State<SplashTimerScreen> createState() => _SplashTimerScreenState();
}

class _SplashTimerScreenState extends State<SplashTimerScreen> {
  final SplashTimerVeiwmodel viewmodel=SplashTimerVeiwmodel();

  @override
  void initState() {
    super.initState();
    viewmodel.startTimer(context);
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