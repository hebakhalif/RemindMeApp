import 'package:flutter/material.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/features/onboarding/presentation/viewmodels/onbording_view_model.dart';
import 'package:point_ease/features/onboarding/presentation/widget/onboarding_widget.dart';
import 'package:provider/provider.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

 @override
  Widget build(BuildContext context) {
    // create an instance of OnboardingViewModel using Provider
    // to access the view model and its properties
    final viewModel = Provider.of<OnboardingViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Stack(
          children: [
            PageView.builder(
              controller: viewModel.pageController,
              itemCount: viewModel.onboardingItems.length,
              onPageChanged: (index) {
              viewModel.updatePage(index);
              },
              itemBuilder: (context, index) {
                return OnboardingWidget(
                 model: viewModel.onboardingItems[index],
                 currentStep: viewModel.currentStep,
                 onNextPressed : () => viewModel.nextPage(context),
                );
              },
            ), 
          /*  Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  viewModel.onboardingItems.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: viewModel.currentStep == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: viewModel.currentStep == index
                          ? AppColors.primaryColorgreen
                          : AppColors.shimmer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}