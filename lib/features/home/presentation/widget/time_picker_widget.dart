import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:point_ease/core/themes/app_colors.dart';

Future<TimeOfDay?> showIosTimePicker(BuildContext context, TimeOfDay initialTime) {
  // تحويل TimeOfDay إلى DateTime حتى نمرره لـ CupertinoDatePicker
  final now = DateTime.now();
  DateTime initialDateTime = DateTime(
    now.year,
    now.month,
    now.day,
    initialTime.hour,
    initialTime.minute,
  );

  return showGeneralDialog<TimeOfDay>(
    context: context,
    barrierDismissible: true,        // إغلاق الحوار عند الضغط خارج النافذة
    barrierLabel: 'TimePicker',
    barrierColor: const Color.fromARGB(137, 0, 0, 0),    // خلفية شفافة خلف الحوار
    pageBuilder: (context, anim1, anim2) {
      // سنستخدم متغير مؤقت لتخزين الوقت المختار داخل الحوار
      DateTime selectedDateTime = initialDateTime;

      return Center(
        // نستخدم Center لضبط المكان في منتصف الشاشة
        child: Material(
          color: Colors.transparent, // نجعل خلفية الـ Dialog شفافة
          child: Container(
            width: 250, // يمكنك تعديل العرض حسب التصميم
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 44, 46, 44), // لون داكن مشابه لـ iOS
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // منتقي الوقت بأسلوب Cupertino
                SizedBox(
                  height: 150,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(color: AppColors.backgroundWhite,
                        fontSize: 17,
                        ),
                      ),
                    ),
                    
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: false,             // false = صيغة 12 ساعة مع AM/PM
                      initialDateTime: initialDateTime,
                      backgroundColor: const Color.fromARGB(0, 134, 194, 32),
                      onDateTimeChanged: (DateTime newDateTime) {
                        selectedDateTime = newDateTime;
                      },
                    ),
                  ),
                ),
                // أزرار Cancel / OK
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(), 
                      child: Text("canceltext".tr(), style: TextStyle(color: const Color.fromARGB(255, 86, 243, 33))),
                    ),
                    TextButton(
                      onPressed: () {
                        // عند الضغط على OK نُرجع الوقت المختار كـ TimeOfDay
                        final newTime = TimeOfDay(
                          hour: selectedDateTime.hour,
                          minute: selectedDateTime.minute,
                        );
                        Navigator.of(context).pop(newTime);
                      },
                      child: Text("Ok".tr(), style: TextStyle(color: const Color.fromARGB(255, 86, 243, 33))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    // تأثيرات الظهور والإخفاء (اختياري)
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
  );
}