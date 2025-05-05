import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/core/helpers/custom_button.dart';
import 'package:point_ease/features/home/presentation/widget/date_picker_State_widget.dart';

class BottomSheetHelper {
  static void show(BuildContext context){
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
                        onPressed: () {
                              Navigator.pop(context);
                        },
                        child: Expanded(
                          child: Text(
                        "canceltext".tr(),
                            style: TextStyles.font17Greybold,
                          ),
                        ),
                      ),
              
                      Expanded(
                        child: Center(
                          child: Text(
                              "newtask".tr(),
                            style: TextStyles.font16blak45bold,
                          ),
                        ),
                      ),
              
                      TextButton(
                        onPressed: () {},
                        child: Expanded(
                          child: Text(
                            "save".tr(),
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
                          hintText:"task_title".tr(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 13),
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
                         "description_Sheet_bot".tr(),
                           style: TextStyles.font13blak45bold,
                        ),
            
                        SizedBox(height: 30.h),
                        Custombutton(
                          text:"delete_task".tr(),
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
}