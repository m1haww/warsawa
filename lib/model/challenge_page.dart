import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsawa/model/challenge.dart';
import 'package:warsawa/pages/activities.dart';

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
      backgroundColor: Color(0xff6A1E55),
      appBar: AppBar(
        backgroundColor: Color(0xff6A1E55),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => activities(),
                  ));
            },
            child: Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Challenge Details',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Challenge Title Card
            _buildDetailCard(
              title: 'Challenge Title',
              value: widget.challenge.title,
              icon: Icons.title,
            ),
            const SizedBox(height: 20),

            // Challenge Description Card
            _buildDetailCard(
              title: 'Description',
              value: widget.challenge.description,
              icon: Icons.description,
              isMultiline: true,
            ),
            const SizedBox(height: 20),

            // Time Frame and Difficulty Card
            Row(
              children: [
                Expanded(
                  child: _buildDetailCard(
                    title: 'Time Frame',
                    value: widget.challenge.timeFrame,
                    icon: Icons.calendar_today,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDetailCard(
                    title: 'Difficulty',
                    value: widget.challenge.difficulty,
                    icon: Icons.emoji_events,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Goals Section
            const Text(
              'Goals',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF34517D),
              ),
            ),
            const SizedBox(height: 10),
            ...widget.challenge.goalsStatus.entries.map((entry) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: Icon(
                  entry.value
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: entry.value ? Colors.green : Colors.grey,
                ),
                title: Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  entry.value ? 'Completed' : 'Pending',
                  style: TextStyle(
                    fontSize: 16,
                    color: entry.value ? Colors.green : Colors.red,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  // Helper method to build detail cards
  Widget _buildDetailCard({
    required String title,
    required String value,
    required IconData icon,
    bool isMultiline = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FF), // Light background color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: const Color(0xFF34517D),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF34517D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: isMultiline ? 4 : 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
