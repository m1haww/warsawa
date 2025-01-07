import 'package:flutter/material.dart';

class informationbuton extends StatefulWidget {
  final String techniqueName;

  informationbuton({required this.techniqueName});

  @override
  State<informationbuton> createState() => _informationbutonState();
}

class _informationbutonState extends State<informationbuton> {
  final Map<String, String> techniqueDetails = {
    'Breathing':
        'Breathing techniques are simple exercises that help calm your mind and body. Focus on slow, deep breaths to reduce stress and enhance mindfulness.',
    'Meditation':
        'Meditation involves focusing your mind to achieve a mentally clear and emotionally calm state. It helps with relaxation and self-awareness.',
    'Body Scan':
        'Body scan meditation helps you become aware of physical sensations in your body. It is an effective way to release tension and enhance relaxation.',
    'Mindful Walking':
        'Mindful walking combines walking with mindfulness. Pay attention to each step and your surroundings, helping you stay present and grounded.',
    'Visualization':
        'Visualization is a technique where you imagine calming scenes or positive outcomes. It is a powerful tool for reducing stress and building confidence.',
  };

  @override
  Widget build(BuildContext context) {
    // Fetch the detailed information for the selected technique
    final String detailText = techniqueDetails[widget.techniqueName] ??
        'No details available for this technique.';

    return Scaffold(
      backgroundColor: Color(0xff6A1E55),
      appBar: AppBar(
        title: Text('${widget.techniqueName} Details'),
        backgroundColor: Color(0xff6A1E55),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.info_outline,
              size: 100,
              color: Colors.pink,
            ),
            const SizedBox(height: 20),
            Text(
              widget.techniqueName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              detailText,
              style: const TextStyle(
                  fontSize: 18, height: 1.5, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
