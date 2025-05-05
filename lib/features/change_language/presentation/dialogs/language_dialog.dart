import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/features/change_language/presentation/viewmodels/language_viewmodel.dart';

class LanguageDialog {
  static void show(BuildContext context) {
    final viewmodel=LanguageViewmodel();
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shadowColor: AppColors.backgroundWhite,
          backgroundColor: const Color.fromARGB(255, 179, 224, 178),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          title: Text("Select_Language".tr(), style: TextStyles.font21blac87bold,),
          content: SizedBox(
            width: 150.w,
            height: 200.h,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    ListTile(
                      title: Text("简体"),
                      onTap: () {
                        viewmodel.changeLanguage(context, Locale('zh'));
                      },
                    ),
                  ListTile(
                    title: Text("English"),
                    onTap: () {
                      viewmodel.changeLanguage(context, Locale('en'));
                    },
                  ),
                  ListTile(
                    title: Text("العربية"),
                    onTap: () {
                      viewmodel.changeLanguage(context, Locale('ar'));
                    },
                  ),
                   ListTile(
                    title: Text("French"),
                    onTap: () {
                      viewmodel.changeLanguage(context, Locale('fr'));
                    },
                  ),
                   ListTile(
                    title: Text("German"),
                    onTap: () {
                      viewmodel.changeLanguage(context, Locale('de'));
                    },
                  ),
                   
                   
                ],
              ),
            ),
          ),
        );
      },
    );
  }}