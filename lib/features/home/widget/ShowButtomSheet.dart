import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/features/home/widget/Custombutton.dart';
import 'package:point_ease/features/home/widget/DatePickerState.dart';

 void ShowBottomSheet(BuildContext context) {
    var Size = MediaQuery.sizeOf(context);
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: Size.height / 1.1,
            width: double.infinity,

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Expanded(
                          child: Text(
                            "Cancel",
                            style: TextStyles.font17Greybold,
                          ),
                        ),
                      ),
              
                      Expanded(
                        child: Center(
                          child: Text(
                            "New Task",
                            style: TextStyles.font16blak45bold,
                          ),
                        ),
                      ),
              
                      TextButton(
                        onPressed: () {},
                        child: Expanded(
                          child: Text(
                            "Save",
                            style: TextStyles.font17Greybold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Material(
                      color: AppColors.textColorwiWhite,
                      shadowColor: const Color.fromARGB(208, 255, 255, 255),
                      elevation: 2,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  Task Title",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        minLines: 2,
                        maxLines: null,
                      ),
                    ),
                  ),
              
                  DatepickerWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "the task duration and due date will determine the task reminders and your status",
                        ),
                        SizedBox(height: 30.h),
                        Custombutton(
                          text: "Delete Task",
                          width: double.infinity,
                          height: 30,
                          color: AppColors.backgroundWhite,
                          colorText: AppColors.delete,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  } 