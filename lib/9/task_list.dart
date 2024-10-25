import 'package:flutter/material.dart';

import 'InheritedWidget/inherited_widget.dart';
import 'task_detail.dart';


class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _textController = TextEditingController();

  void _addTask() {
    if (_textController.text.isNotEmpty) {
      TaskInheritedWidget.of(context)?.addTask(_textController.text);
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tasks = TaskInheritedWidget.of(context)?.tasks ?? [];

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: _textController,
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
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskDetailScreen(task: tasks[index])),
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
