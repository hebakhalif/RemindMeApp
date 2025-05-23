import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/routing/app_router.dart';
import 'package:point_ease/core/routing/router.dart';

class RemindMe extends StatelessWidget {
  final AppRouter appRouter;
  const RemindMe({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(374, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          locale: context.locale, 
          supportedLocales: context.supportedLocales, 
          localizationsDelegates: context.localizationDelegates, 
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          initialRoute: Routes.splashTimerScreen,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}