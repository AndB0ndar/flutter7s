import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Path (Mobile)')),
      body: const Center(child: Text('Noting')),
    );
  }
}

// mobile
class MobileTodoPage extends StatefulWidget {
  @override
  State<MobileTodoPage> createState() => _MobileTodoPageState();
}
class _MobileTodoPageState extends State<MobileTodoPage> {
  String _currentPath = '';
  @override
  void initState() {
    super.initState();
    _getCurrentPath();
  }
  Future<void> _getCurrentPath() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() => _currentPath = directory.path);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Path (Mobile)')),
      body: Center(child: Text('Current Path: $_currentPath')),
    );
  }
}

// desktop
class DesktopTodoPage extends StatefulWidget {
  @override
  State<DesktopTodoPage> createState() => _DesktopTodoPageState();
}
class _DesktopTodoPageState extends State<DesktopTodoPage> {
  String _currentPath = '';
  @override
  void initState() {
    super.initState();
    setState(() => _currentPath = Directory.current.path);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Path (Desktop)')),
      body: Center(child: Text('Current Path: $_currentPath')),
    );
  }
}
