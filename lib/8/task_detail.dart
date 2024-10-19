import 'package:flutter/material.dart';
import 'models/task.dart';

import 'package:cached_network_image/cached_network_image.dart';


class TaskDetailScreen extends StatelessWidget {
  final Task task;
  const TaskDetailScreen({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали задачи')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Задача:', style: TextStyle(fontSize: 24)),
                Text(task.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                    task.description ?? 'Описание отсутствует',
                    style: const TextStyle(fontSize: 16)
                ),
                Text(
                    'Статус: ${task.completed ? 'Завершена' : 'Не завершена'}',
                    style: const TextStyle(fontSize: 16)
                ),
                ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Назад')),
              ],
            ),
            CachedNetworkImage(
              imageUrl: 'http://127.0.0.1:8000/images/${task.image}',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
