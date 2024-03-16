import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/taskstatushelper.dart';
import 'package:flutter_application_1/logic/tasks.dart';

import 'addtaskdialogue.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late String status;
  final List<Task> _tasks = [];

  void _addTask(String title, String description) {
    setState(() {
      _tasks.add(Task(
          title: title, description: description, status: TaskStatus.newTask));
    });
  }

  void _updateTaskStatus(int index, TaskStatus newStatus) {
    setState(() {
      _tasks[index].status = newStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    status = 'All'; // initialization in initState
  }

  @override
  Widget build(BuildContext context) {
    final List<Task> visibleTasks = _tasks.where((task) {
      if (status == 'newTask') {
        // Changed status string to match the enum value
        return true;
      } else {
        return task.status ==
            TaskStatusHelper.getStatusFromString(
                status); // Using TaskStatusHelper to convert string to enum
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showAddTaskDialog();
                },
                child: Text('Add Task'),
              ),
              DropdownButton<TaskStatus>(
                value: TaskStatusHelper.getStatusFromString(
                    status), // Converting string to enum
                onChanged: (TaskStatus? newValue) {},
                items: <TaskStatus>[
                  TaskStatus.newTask,
                  TaskStatus.inProgress,
                  TaskStatus.complete
                ].map<DropdownMenuItem<TaskStatus>>((TaskStatus value) {
                  return DropdownMenuItem<TaskStatus>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: visibleTasks.length,
              itemBuilder: (context, index) {
                final task = visibleTasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: DropdownButton(
                    value: task.status,
                    onChanged: (TaskStatus? newValue) {
                      _updateTaskStatus(
                          index, TaskStatusHelper.getStatusFromString(status));
                    },
                    items: <TaskStatus>[
                      TaskStatus.newTask,
                      TaskStatus.inProgress,
                      TaskStatus.complete
                    ].map<DropdownMenuItem<TaskStatus>>((TaskStatus value) {
                      return DropdownMenuItem<TaskStatus>(
                        value: value,
                        child: Text(value.toString().split('.').last),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // void _updateTaskStatus(int index, TaskStatus newStatus) {
  //   setState(() {
  //     _tasks[index].status = newStatus;
  //   });
  // }

  void _showAddTaskDialog() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          onAddTask: _addTask,
        );
      },
    );
    if (result == 'Cancel') {
      return;
    }
  }
}
