import 'package:flutter/material.dart';
import 'package:warsawa/pages/CustomAppBar.dart';
import 'package:warsawa/utils/buton.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final String title = "Warsawa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [Icon(Icons.search), Text("Discover")],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: buton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
