import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/tasks.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      trailing: DropdownButton<TaskStatus>(
        value: task.status,
        onChanged: (TaskStatus? newStatus) {
          if (newStatus != null) {
            task.status = newStatus;
          }
        },
        items: TaskStatus.values
            .map((status) => DropdownMenuItem<TaskStatus>(
                  value: status,
                  child: Text(status.toString().split('.').last),
                ))
            .toList(),
      ),
    );
  }
}
