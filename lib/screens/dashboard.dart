import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginpage.dart';
import 'package:flutter_application_1/components/addtaskdialogue.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> _tasks = [];

  void _addTask(String taskName) {
    setState(() {
      _tasks.add(taskName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brackits'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            'ALL tasks Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final taskName = await showDialog<String>(
                context: context,
                builder: (context) {
                  return AddTaskDialog(
                    onAddTask: (taskName, taskStatus) {
                      // code to handle adding the task to the list
                    },
                  );
                },
              );
              if (taskName != null && taskName.isNotEmpty) {
                _addTask(taskName);
              }
            },
            child: const Text('Add Task'),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(task),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginPage()));
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
