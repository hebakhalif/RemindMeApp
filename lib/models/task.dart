import 'package:flutter/material.dart';
import 'package:point_ease/core/themes/app_colors.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? backgroundColor;
  Color? iconColor;
  Color? buttonColor;
  bool? isLast;
  num? Lift;
  num? done;

  Task({
    this.iconData,
    this.title,
    this.backgroundColor,
    this.iconColor,
    this.buttonColor,
    this.isLast,
    this.Lift,
    this.done,
  });
  static List<Task> generateTasks(){
    return [
      Task(iconData: Icons.person_rounded,
      title: "Personal",
      backgroundColor: Colors.cyan,
      iconColor: AppColors.shimmer,
      buttonColor: AppColors.primaryLight,
      Lift: 3,
      done: 1,
      ),
       Task(iconData: Icons.cases_rounded,
      title: "Cases",
      backgroundColor: Colors.cyan,
      iconColor: AppColors.shimmer,
      buttonColor: AppColors.primaryLight,
      Lift: 0,
      done: 0,
      ),
       Task(iconData: Icons.favorite_rounded,
      title: "Favorite",
      backgroundColor: Colors.cyan,
      iconColor: AppColors.shimmer,
      buttonColor: AppColors.primaryLight,
      Lift: 0,
      done: 0,
      ),
      Task(isLast: true)
    ];
  }
}
