import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/features/onboarding/data/models/onbording_model.dart';

class OnboardingWidget extends StatelessWidget {
  final OnbordingModel model;
  final int currentStep; 
  final VoidCallback onNextPressed; // دالة التنقل بين الصفحات

  const OnboardingWidget({
    required this.model,
    required this.currentStep,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
         child: Image.asset(
          model.image,
           width: 500.w,
           height: 300.h,
         ),
   ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(model.title, style: TextStyles.font24boldwhite),
              SizedBox(
                height: 100,
                child: Text(
                  model.description,
                  style: TextStyles.font25boldblack,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 90.h),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(3, (index) {
                        bool isActive = currentStep == index;
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.all(4),
                          width: isActive ? 15 : 10,
                          height:
                              isActive
                                  ? 15
                                  : 10, 
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                currentStep == index ? const Color.fromARGB(255, 77, 102, 76) : Colors.grey,
                          ),
                        );
                      }),
                    ),
                    SizedBox(width: 60.w),
                    Material(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 77, 102, 76),
                        child: IconButton(
                        onPressed: onNextPressed, 
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
