import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/helpers/bottom_sheet_helper.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/features/home/widget/Change_Language.dart';
import 'package:point_ease/features/home/widget/TaskTabs.dart';

class HomeScrren extends StatefulWidget {
  const HomeScrren({Key? key, required this.onLanguageChanged})
    : super(key: key);
  final Function(Locale) onLanguageChanged;
  @override
  _HomeScrrenState createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  int selectedIndex = 0;
  int selectedTabIndex = 0;

  /*void showBtmSheet(BuildContext context) {
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
                          child: Text("save".tr(), style: TextStyles.font17Greybold),
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
                          hintText: "task_title".tr(),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        minLines: 2,
                        maxLines: null,
                      ),
                    ),
                  ),
                  DatepickerWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "description_Sheet_bot".tr(),
                          style: TextStyles.font13blak45bold,
                        ),
                        SizedBox(height: 30.h),
                        Custombutton(
                          text: "delete_task".tr(),
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
  }*/

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.textColorwiWhite,
    appBar: AppBar(
      backgroundColor: AppColors.textColorwiWhite,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            changeLanguage(context);
          },
          icon: Icon(Icons.language , color:AppColors.primaryColorgreen),
        ),
        IconButton(
          onPressed: () {
            BottomSheetHelper.show(context);
          },
          icon: Icon(Icons.add, size: 30, color: AppColors.primaryColorgreen),
        ),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("task_title".tr(), style: TextStyles.fontTask), // ✅ "Task"
            SizedBox(height: 10.h),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 40,
                width: 500,
                child: CupertinoSearchTextField(
                  placeholder: "search task".tr(), // ✅ "Search Task"
                  placeholderStyle: TextStyle(color: Colors.grey),
                  backgroundColor: const Color.fromARGB(208, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            TaskTabs(
              onTabSelected: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),

            Image.asset("assets/images/imageHomePige.png"),
            Center(
              child: Text("nowtask".tr(), style: TextStyles.font17Greybold), // ✅ "No Task Yet"
            ),
            Center(
              child: Text(
                "homedescription".tr(), // ✅ "From ongoing projects to future work plans\nanything can be recorded here Tap + to"
                style: TextStyles.font13blak45bold,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text("homedescription3".tr(), // ✅ "quick add"
                  style: TextStyles.font13blak45bold),
            ),
          ],
        ),
      ),
    ),
  );
}}