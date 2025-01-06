import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsawa/model/challenge.dart';

class challengepage extends StatefulWidget {
  final Challenge challenge;

  challengepage({required this.challenge});

  @override
  _challengepageState createState() => _challengepageState();
}

class _challengepageState extends State<challengepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying Challenge Title
            Text(
              'Title: ${widget.challenge.title}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),

            // Displaying Challenge Description
            Text(
              'Description: ${widget.challenge.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Displaying Time Frame
            Text(
              'Time Frame: ${widget.challenge.timeFrame}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Displaying Difficulty
            Text(
              'Difficulty: ${widget.challenge.difficulty}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Displaying Goals
            Text(
              'Goals:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...widget.challenge.goalsStatus.entries.map((entry) {
              return Text(
                '${entry.key}: ${entry.value ? 'Completed' : 'Not Completed'}',
                style: TextStyle(fontSize: 16),
              );
            }).toList(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
