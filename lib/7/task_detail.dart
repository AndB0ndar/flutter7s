import 'package:flutter/material.dart';
import 'models/task.dart'; // Импортируем модель Task


class TaskDetailScreen extends StatelessWidget {
  final Task task; // Теперь мы используем объект Task

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали задачи'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Задача:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              task.title, // Отображаем заголовок задачи
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              task.description ?? 'Описание отсутствует', // Отображаем описание задачи
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Статус: ${task.completed ? 'Завершена' : 'Не завершена'}', // Отображаем статус задачи
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Возврат назад к списку задач
              },
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
