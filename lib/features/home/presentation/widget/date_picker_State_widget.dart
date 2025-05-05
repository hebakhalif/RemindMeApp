import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/features/home/presentation/widget/Time_Picker_Widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/core/themes/styles.dart';

class DatepickerWidget extends StatefulWidget {
  const DatepickerWidget({super.key});

  @override
  State<DatepickerWidget> createState() => _DatepickerWidgetState();
}

class _DatepickerWidgetState extends State<DatepickerWidget> {
  bool showDatePickerff = false; // إظهار التقويم
  DateTime? startDate;
  DateTime? endDate;
  int? durationDays;
  bool isDue = false;
 
 TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.textColorwiWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showDatePickerff = !showDatePickerff;
                        });
                      },

                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: AppColors.primaryColorgreen,
                          ),
                          Text("due_date".tr(), style: TextStyles.font17Greybold),
                          Spacer(flex: 1),
                          Text(
                            startDate == null
                                ? "---"
                                : "${formatDate(startDate!)} - ${endDate == null ? "---" : formatDate(endDate!)}",
                            style: TextStyles.font14DueDate,
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1, indent: 6, endIndent: 1, height: 20),

                    
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_rounded,
                          color: AppColors.primaryColorgreen,
                        ),
                        Text("duration".tr(), style: TextStyles.font17Greybold),
                        Spacer(flex: 1),
                        Text(
                          "${durationDays ?? "---"} ${"duration_days".tr()}".tr(),
                          style: TextStyles.font14DueDate,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          if (showDatePickerff)
            Container(
              height: 270.h,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.textColorwiWhite,
              ),
              child: SfDateRangePicker(
                headerStyle: DateRangePickerHeaderStyle(
                  backgroundColor: AppColors.backgroundWhite,
                ),
                // تغيير لون اليوم الحالي
                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayTextStyle: TextStyle(
                    color: AppColors.primaryColorgreen,
                    fontWeight: FontWeight.bold,
                  ),
                  // تغيير شكل اليوم الحالي يعني محاط بمربع ولا دائره ولونها وكده
                  todayCellDecoration: BoxDecoration(
                    color: AppColors.backgroundWhite,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 76, 102, 77),
                      width: 1.w,
                    ),
                  ),
                ),

                startRangeSelectionColor: const Color.fromARGB(
                  77,
                  77,
                  102,
                  76,
                ), // لون الاختيار الاول
                backgroundColor: AppColors.backgroundWhite,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is PickerDateRange) {
                    final PickerDateRange range = args.value;
                    final DateTime? start = range.startDate;
                    final DateTime? end = range.endDate;

                    if (start != null && end != null) {
                      final difference = end.difference(start).inDays;
                      setState(() {
                        startDate = start;
                        endDate = end;
                        durationDays = difference;
                        showDatePickerff = false; // إخفاء التقويم بعد الاختيار
                      });
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            // مربع الوقت الذي نضغط عليه لفتح الـ Picker
            InkWell(
              onTap: () async {
                // استدعاء الدالة التي أنشأناها
                final pickedTime = await showIosTimePicker(context, selectedTime);
                // إذا المستخدم اختار وقت وضغط OK
                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
              // time widget
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                child: Row(
                  children: [
                  Text(
                    "Time".tr(),
                  style: TextStyles.font17Greybold,
                  ),
                  Spacer(flex: 1,),
                   Container(
                    height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(104, 0, 0, 0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // عرض الوقت الحالي
                  child: Text(
                    // تنسيق الوقت باستخدام خاصية format
                    selectedTime.format(context), 
                    style: TextStyle(color: AppColors.backgroundWhite, fontSize: 16),
                  ),
                ),
                  ],
                ),
              )
            ),

            // time widget
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    return "${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}";
  }

  String _twoDigits(int value) {
    return value < 10 ? "0$value" : value.toString();
  }
}
