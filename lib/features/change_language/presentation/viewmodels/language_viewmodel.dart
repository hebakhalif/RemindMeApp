import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageViewmodel {
  void changeLanguage(BuildContext context, Locale locale) {
    context.setLocale(locale);
    Navigator.pop(context); // Close the dialog after changing the language
  }
}