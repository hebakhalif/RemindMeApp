import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:point_ease/core/routing/app_router.dart';
import 'package:point_ease/taskaty.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  FlutterError.onError=FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    TasKaty(
      appRouter: AppRouter(),
    ),
  );
}      
