import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<TaskService>(TaskService());
}

class TaskService {
  List<String> _tasks = ['Задача 1', 'Задача 2', 'Задача 3'];

  List<String> get tasks => List.unmodifiable(_tasks);

  void addTask(String task) {
    _tasks.add(task);
  }

  List<String> filterTasks(String query) {
    return _tasks.where((task) => task.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
