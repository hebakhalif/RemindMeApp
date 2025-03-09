import 'package:flutter/material.dart';
import 'package:point_ease/core/themes/app_colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final double progress;
  final VoidCallback onNext;

  const FloatingActionButtonWidget({
    required this.progress,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // الدائرة الخارجية (شريط التقدم)
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonPrimary),
            ),
          ),
          // الزر الأساسي
          GestureDetector(
            onTap: onNext,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}