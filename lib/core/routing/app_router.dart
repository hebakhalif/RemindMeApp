import 'package:flutter/material.dart';
import 'package:point_ease/core/routing/router.dart';
import 'package:point_ease/features/home/screens/home_scrren.dart';
import 'package:point_ease/features/home/screens/layout_scrren.dart';
import 'package:point_ease/features/home/screens/onboarding_screen.dart';
import 'package:point_ease/features/home/screens/profile_scrren.dart';
import 'package:point_ease/features/splash/splash_timar.dart';

class AppRouter {
   Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen: 
        return MaterialPageRoute(builder: (_) => OnboardingMainScreen());   
     case Routes.homescrren: 
     return MaterialPageRoute(builder: (_) => HomeScrren());    
       case Routes.profileScrren: 
       return MaterialPageRoute(builder: (_) => ProfileScrren());  
       case Routes.layoutScreen:
        return MaterialPageRoute(builder: (_) => MainLayout());
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