import 'package:flutter/material.dart';
import 'package:point_ease/core/routing/router.dart';
import 'package:point_ease/features/home/presentation/screens/home_scrren.dart';
import 'package:point_ease/features/onboarding/presentation/screens/onbording_screen.dart';
import 'package:point_ease/features/splash/presenation/screen/splash_timer_screen.dart';

class AppRouter {
   Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen: 
        return MaterialPageRoute(builder: (_) => OnbordingScreen());       
          case Routes.layoutScreen:
        return MaterialPageRoute(builder: (_) => HomeScrren(onLanguageChanged: (Locale locale) {
          // Handle language change logic here
        }));
         case Routes.splashTimerScreen:
        return MaterialPageRoute(builder: (_) => SplashTimerScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found!')),
          ),
        );
    }
  }
}