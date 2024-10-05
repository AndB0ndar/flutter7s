import 'package:flutter/material.dart';


class ColumnScreen extends StatefulWidget {
  const ColumnScreen({super.key});

  @override
  State<ColumnScreen> createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  final List<String> _tasks = List.generate(10, (index) => 't${index + 1}');
  final TextEditingController _textController = TextEditingController();
  void _addTask() {
    if (_textController.text.isNotEmpty) {
      setState(() {_tasks.add(_textController.text); _textController.clear();});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Список на Column')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Add a task', border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _addTask, child: Text('Добавить задачу')),
            Column(
              children: _tasks.map((it) => GestureDetector(
                key: ValueKey(it),
                child: ListTile(
                  title: Text(it),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => setState(() => _tasks.remove(it))
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
