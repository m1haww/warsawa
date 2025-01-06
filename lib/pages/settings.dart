import 'package:flutter/material.dart';
import 'package:warsawa/pages/CustomAppBar.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  final String title = "Warsawa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
    );
  }
}
