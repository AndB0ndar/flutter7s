import 'package:flutter/material.dart';

class TaskInheritedWidget extends InheritedWidget {
  final List<String> tasks;
  final Function(String) addTask;

  const TaskInheritedWidget({
    super.key,
    required this.tasks,
    required this.addTask,
    required Widget child,
  }) : super(child: child);

  static TaskInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInheritedWidget>();
  }

  @override
  bool updateShouldNotify(TaskInheritedWidget oldWidget) {
    return oldWidget.tasks != tasks;
  }
}
