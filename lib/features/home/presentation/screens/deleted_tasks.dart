import 'package:flutter/material.dart';

class DeletedTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      key: ValueKey(1),
      children: List.generate(5, (index) => ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text("Deleted Task ${index + 1}"),
        subtitle: Text("This task was removed"),
      )),
    );
  }
}