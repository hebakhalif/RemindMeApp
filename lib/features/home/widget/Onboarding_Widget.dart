import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/styles.dart';

class OnboardingWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int currentStep;
  final VoidCallback onNextPressed; // دالة التنقل بين الصفحات

  const OnboardingWidget({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.currentStep,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/images/Ellipse 10.png",
                width: 350,
                height: 350,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/Vector 49.png",
                width: 350,
                height: 350,
              ),
            ),
             Center(
              child: Image.asset(
                imagePath,
                width: 350,
                height: 350,
               
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.font24boldwhite),
              Text(
                description,
                style: TextStyles.font45boldblack,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                              currentStep == index ? Colors.black : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 60.w),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    child: IconButton(
                      onPressed: onNextPressed, // استخدام الدالة مباشرة
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
