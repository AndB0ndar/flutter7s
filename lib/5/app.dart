import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlatformSpecificHomePage(),
    );
  }
}

// home
class PlatformSpecificHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return WebTodoPage();
    } else if (Platform.isAndroid || Platform.isIOS) {
      return MobileTodoPage();
    } else {
      return DesktopTodoPage();
    }
  }
}

// web
class WebTodoPage extends StatelessWidget {
  final List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List (Web)'),
      ),
      body: const Center(
        child: Text('Это страница для веб-платформы'),
      ),
    );
  }
}

// mobile
class MobileTodoPage extends StatefulWidget {
  @override
  _MobileTodoPageState createState() => _MobileTodoPageState();
}
class _MobileTodoPageState extends State<MobileTodoPage> {
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List (Mobile)')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Добавить задачу', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(onPressed: _addTodo, child: Text('Добавить')),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length, itemBuilder: (_, index) => ListTile(title: Text(_todos[index]))
            ),
          ),
        ],
      ),
    );
  }
}

// desktop
class DesktopTodoPage extends StatefulWidget {
  @override
  _DesktopTodoPageState createState() => _DesktopTodoPageState();
}

class _DesktopTodoPageState extends State<DesktopTodoPage> {
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List (Desktop)')),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Добавить задачу', border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: _addTodo, child: Text('Добавить')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length, itemBuilder: (_, index) => ListTile(title: Text(_todos[index])),
            ),
          ),
        ],
      ),
    );
  }
}
