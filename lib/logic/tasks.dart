class Task {
  late String title;
  late String description;
  late TaskStatus status;

  Task({
    required this.title,
    required this.description,
    required this.status,
  });

  String get name => title; // add a getter for the title as name
}

enum TaskStatus {
  newTask,
  inProgress,
  complete,
}
