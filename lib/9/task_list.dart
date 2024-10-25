import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter7s/9/task_detail.dart';
import 'Service/TaskService.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _textController = TextEditingController();
  final TaskService _taskService = GetIt.I<TaskService>();

  void _addTask() {
    if (_textController.text.isNotEmpty) {
      _taskService.addTask(_textController.text);
      _textController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final tasks = _taskService.tasks;

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Add a task', border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: _addTask, child: const Text('Добавить задачу')),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailScreen(task: tasks[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
