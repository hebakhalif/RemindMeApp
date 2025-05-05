import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:point_ease/core/routing/app_router.dart';
import 'package:point_ease/features/onboarding/presentation/viewmodels/onbording_view_model.dart';
import 'package:point_ease/taskaty.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingViewModel()),
      ],
      child: EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
          Locale('fr'),
          Locale('de'),
          Locale('zh'),
        ],
        path: 'assets/lang',
        fallbackLocale: Locale('en'),
        child: RemindMe(appRouter: AppRouter()),
      ),
    ),
  );
}
