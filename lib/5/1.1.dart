import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Platform Check Example'),
        ),
        body: Center(
          child: PlatformMessage(),
        ),
      ),
    );
  }
}

class PlatformMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Сообщение для веб-платформы
      return Text('Вы используете веб-платформу');
    } else {
      // Сообщение для мобильной или десктопной платформы
      return Text('Вы используете мобильную или десктопную платформу');
    }
  }
}
