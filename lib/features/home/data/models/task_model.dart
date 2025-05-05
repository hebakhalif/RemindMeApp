import 'package:flutter/material.dart';
import 'package:point_ease/models/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> tasks=[];

  void addTask (String titel , String decoration){
    var newtask = Task(titleTask: titel,description: decoration);
    tasks.add(newtask);
    notifyListeners();
  }


  void toggelTaskCompletion (Task task){
    task.isCompleted=!task.isCompleted;
    notifyListeners();
  }
}
