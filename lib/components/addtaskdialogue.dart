import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  final void Function(String taskName, String status) onAddTask;

  const AddTaskDialog({Key? key, required this.onAddTask}) : super(key: key);

  @override
  AddTaskDialogState createState() => AddTaskDialogState();
}

class AddTaskDialogState extends State<AddTaskDialog> {
  late String taskName;
  String status = 'New';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              taskName = value;
            },
            decoration: const InputDecoration(
              labelText: 'Task Name',
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          DropdownButtonFormField<String>(
            value: status,
            onChanged: (value) {
              setState(() {
                status = value!;
              });
            },
            items: <String>['New', 'In Progress', 'Complete']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Status',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onAddTask(taskName, status);
            Navigator.of(context).pop(taskName);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
