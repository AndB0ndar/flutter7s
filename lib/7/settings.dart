import 'package:flutter/material.dart';


class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
            title: Text('Темный режим'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          Text(
            'Темный режим ${_darkMode ? "включен" : "выключен"}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
