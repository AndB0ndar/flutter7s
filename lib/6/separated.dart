import 'package:flutter/material.dart';


class ListViewSeparatedScreen extends StatefulWidget {
  const ListViewSeparatedScreen({super.key});

  @override
  State<ListViewSeparatedScreen> createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  final List<String> _tasks = List.generate(10, (index) => 't${index + 1}');
  final TextEditingController _textController = TextEditingController();
  void _addTask() {
    if (_textController.text.isNotEmpty) {
      setState(() {_tasks.add(_textController.text); _textController.clear();});
    }
  }
  void _removeTask(int index) {
    setState(() => _tasks.removeAt(index));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Список на ListView.separated')),
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
            child: ListView.separated(
              itemCount: _tasks.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete), onPressed: () => _removeTask(index),
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
