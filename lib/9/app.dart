import 'package:flutter/material.dart';

import 'InheritedWidget/inherited_widget.dart';
import 'task_list.dart';
import 'filter.dart';
import 'stats.dart';
import 'settings.dart';


void main() {
  runApp(const TaskApp());
}


class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  final List<String> _tasks = ['Задача 1', 'Задача 2', 'Задача 3'];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskInheritedWidget(
      tasks: _tasks,
      addTask: _addTask,
      child: MaterialApp(
        title: 'Flutter7s',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Flutter7s'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    TaskListScreen(),
    FilterTasksScreen(),
    TaskStatsScreen(),
    UserSettingsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: 'Фильтр',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Статистика',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}