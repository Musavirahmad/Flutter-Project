import 'package:flutter_application_1/logic/tasks.dart';

class TaskStatusHelper {
  static String getStatusString(TaskStatus status) {
    switch (status) {
      case TaskStatus.newTask:
        return 'New Task';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.complete:
        return 'Complete';
    }
  }

  static TaskStatus getStatusFromString(String statusString) {
    switch (statusString) {
      case 'New Task':
        return TaskStatus.newTask;
      case 'In Progress':
        return TaskStatus.inProgress;
      case 'Complete':
        return TaskStatus.complete;
      default:
        throw ArgumentError('Invalid status string: $statusString');
    }
  }
}
