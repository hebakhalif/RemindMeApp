import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/app_colors.dart';

void changeLanguage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shadowColor: AppColors.backgroundWhite,
        backgroundColor: const Color.fromARGB(255, 179, 224, 178),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        title: Text("Select_Language".tr()),
        content: SizedBox(
          width: 150.w,
          height: 110.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("English"),
                  onTap: () {
                    context.setLocale(Locale('en'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("العربية"),
                  onTap: () {
                    context.setLocale(Locale('ar'));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
