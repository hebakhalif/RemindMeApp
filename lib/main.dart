import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:point_ease/core/routing/app_router.dart';
import 'package:point_ease/taskaty.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: Locale('en'),
      child: RemindMe(
        appRouter: AppRouter(),
      ),
    ),
  );
}  

