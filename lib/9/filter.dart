import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter7s/9/task_detail.dart';

import 'Service/TaskService.dart';

class FilterTasksScreen extends StatefulWidget {
  @override
  State<FilterTasksScreen> createState() => _FilterTasksScreenState();
}

class _FilterTasksScreenState extends State<FilterTasksScreen> {
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();
  final TaskService _taskService = GetIt.I<TaskService>();

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _taskService.filterTasks(_searchText);

    return Scaffold(
      appBar: AppBar(title: const Text("Фильтрация задач")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (text) => setState(() =>_searchText = text),
              decoration: const InputDecoration(
                labelText: 'Поиск задач', border: OutlineInputBorder(), prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredTasks[index]),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailScreen(task: filteredTasks[index]),
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
