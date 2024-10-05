import 'dart:io';
import 'package:flutter/material.dart';


class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Platform Example'),
        ),
        body: const Center(
          child: PlatformSpecificWidget(),
        ),
      ),
    );
  }
}

class PlatformSpecificWidget extends StatelessWidget {
  const PlatformSpecificWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String platformMessage;

    if (Platform.isAndroid) {
      platformMessage = 'Running on Android';
    } else if (Platform.isIOS) {
      platformMessage = 'Running on iOS';
    } else if (Platform.isWindows) {
      platformMessage = 'Running on Windows';
    } else if (Platform.isMacOS) {
      platformMessage = 'Running on macOS';
    } else if (Platform.isLinux) {
      platformMessage = 'Running on Linux';
    } else if (Platform.isFuchsia) {
      platformMessage = 'Running on Fuchsia';
    } else {
      platformMessage = 'Unknown Platform';
    }

    return Text(
      platformMessage,
      style: TextStyle(fontSize: 24),
    );
  }
}
