import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/routing/app_router.dart';
import 'package:point_ease/core/routing/router.dart';

class TasKaty extends StatelessWidget {
  final AppRouter appRouter;
  const TasKaty({super.key, 
  required this.appRouter
  });

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
      designSize: const Size(374, 812), 
      minTextAdapt: true,
      builder: (context, child) {
    return  MaterialApp(
      theme: ThemeData(
       // primaryColor:  AppColors.,
        brightness:Brightness.light,
      ),
       initialRoute: Routes.splashTimerScreen, 
       debugShowCheckedModeBanner: false,
       onGenerateRoute: appRouter.generateRoute,
       );
      },
    );
  }
}