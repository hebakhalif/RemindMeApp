import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/features/home/widget/Onboarding_Widget.dart';

class OnboardingMainScreen extends StatefulWidget {
  @override
  _OnboardingMainScreenState createState() => _OnboardingMainScreenState();
}

class _OnboardingMainScreenState extends State<OnboardingMainScreen> {
  final PageController _pageController = PageController();
  int currentStep = 0;

  final List<Map<String, String>> pageData = [
    {
      "image": "assets/images/task.png",
      "title": "", // استخدم المفتاح بدلاً من النص المباشر
      "description": "welcome",
    },
    {
      "image": "assets/images/tasksleep.png",
      "title": "",
      "description": "Procratination",
    },
    {
      "image": "assets/images/taskstudy.png",
      "title": "",
      "description": "worksmart",
    },
  ];

  void nextPage() {
    if (currentStep < pageData.length - 1) {
      setState(() {
        currentStep++;
      });
      _pageController.animateToPage(
        currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/layoutScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: pageData.length,
              onPageChanged: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingWidget(
                  imagePath: pageData[index]["image"]!,
                  title: pageData[index]["title"]!.tr(), // ✅ الترجمة هنا
                  description: pageData[index]["description"]!.tr(), // ✅ الترجمة هنا
                  currentStep: currentStep,
                  onNextPressed: nextPage,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}