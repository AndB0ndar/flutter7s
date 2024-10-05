import 'package:flutter/material.dart';


class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final List<String> _tasks = List.generate(10, (index) => 't${index + 1}');
  final TextEditingController _textController = TextEditingController();
  void _addTask() {
    if (_textController.text.isNotEmpty) {
      setState(() { _tasks.add(_textController.text); _textController.clear();});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список на ListView')),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Add a task', border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: _addTask, child: Text('Добавить задачу')),
          Expanded(
            child: ListView(
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
          ),
        ],
      ),
    );
  }
}
