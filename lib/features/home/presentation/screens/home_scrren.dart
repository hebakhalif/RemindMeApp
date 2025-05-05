import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/helpers/bottom_sheet_helper.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/features/change_language/presentation/widgets/language_button.dart';
import 'package:point_ease/features/home/presentation/widget/task_tabs_builder.dart';

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

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.textColorwiWhite,
    appBar: AppBar(
      backgroundColor: AppColors.textColorwiWhite,
      automaticallyImplyLeading: false,
      actions: [
       LanguageButton(),
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