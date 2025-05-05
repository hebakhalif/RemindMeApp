import 'package:flutter/material.dart';

class CompletedTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      key: ValueKey(0),
      children: List.generate(5, (index) => ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text("Completed Task ${index + 1}"),
        subtitle: Text("This task is done"),
      )),
    );
  }
}