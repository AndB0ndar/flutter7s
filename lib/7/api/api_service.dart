import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  final String baseUrl = 'http://0.0.0.0:8000/tasks/';

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<Task> createTask(Task task) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  Future<Task> updateTask(Task task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }
}
