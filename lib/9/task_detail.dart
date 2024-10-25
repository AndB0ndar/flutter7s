import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final String task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали задачи')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Задача:', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(task, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Назад')),
          ],
        ),
      ),
    );
  }
}
