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
      "image": "assets/images/Group 116.png",
      "title": "",
      "description": "Manage your task and ideas quickly",
    },
    {
      "image": "assets/images/Why_To_Do_Lists_Don_t_Work-removebg-preview.png",
      "title": "",
      "description": "Achieve your goals with simple steps",
    },
    {
      "image": "assets/images/download__25_-removebg-preview.png",
      "title": "",
      "description": "Every small step takes you closer to success",
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
      body: Stack(
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
                title: pageData[index]["title"]!,
                description: pageData[index]["description"]!,
                currentStep: currentStep,
                onNextPressed: nextPage,
              );
            },
          ),
        ],
      ),
    );
  }
}
