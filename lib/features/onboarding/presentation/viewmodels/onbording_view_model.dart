import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:point_ease/features/onboarding/data/models/onbording_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentStep = 0; //ممكن استخدمه للبتون

  final List<OnbordingModel> onboardingItems = [
    OnbordingModel(
      image:"assets/images/task.png",
      title: "",
      description:"welcome".tr(),
    ),
    OnbordingModel(
      image: "assets/images/tasksleep.png",
      title: "",
      description:"Procratination".tr(),
    ),
    OnbordingModel(
      image: "assets/images/taskstudy.png",
      title: "",
      description:"worksmart".tr(),
    ),
  ];

  void updatePage(int index) {
    currentStep = index;
    notifyListeners(); // Notify listeners to update the UI
   // بدل ما استخدم  في البوتون سيت ستيت استدعي الفانكشن علطول
  }

  bool get isLastPage => currentStep == onboardingItems.length - 1;  

  void nextPage(BuildContext context) {
    if (isLastPage) {
      Navigator.pushReplacementNamed(context, '/layoutScreen');
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease, 
      );
    }
  }
}
