import 'package:flutter/material.dart';
import 'task_detail.dart';

import 'api/api_service.dart';
import 'models/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Task>> futureTasks;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureTasks = apiService.fetchTasks();
  }

  void _addTask() async {
    if (_textController.text.isNotEmpty) {
      Task newTask = Task(id: 0, title: _textController.text);
      await apiService.createTask(newTask);
      setState(() => futureTasks = apiService.fetchTasks()); // reload
      _textController.clear();
    }
  }

  // Метод для удаления задачи
  void _deleteTask(int id) async {
    await apiService.deleteTask(id);
    setState(() {
      futureTasks = apiService.fetchTasks(); // Обновляем список задач
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Добавить задачу',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _addTask,
            child: const Text('Добавить задачу'),
          ),
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: futureTasks, // Используем futureTasks для загрузки данных
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Нет задач.'));
                }

                List<Task> tasks = snapshot.data!; // Получаем список задач
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description ?? ''),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _deleteTask(task.id), // Удаление задачи
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailScreen(
                                task: task), // Переход к деталям задачи
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
