import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(children: [
        Text("Language"),
        Text("FAQ"),
        Text("Theme"),
      ]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => true);
          },
          label: Text("Log in")),
    );
  }
}
