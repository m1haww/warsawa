import 'package:flutter/material.dart';
import 'package:warsawa/pages/CustomAppBar.dart';

class resources extends StatefulWidget {
  @override
  State<resources> createState() => _resourcesState();
}

class _resourcesState extends State<resources> {
  @override
  Widget build(BuildContext context) {
    final String title = "Warsawa";

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: title),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.cable, color: Colors.pinkAccent, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Resources",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'images/12.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Meditation sessions\n\n"
                        "A typical guided meditation session can last between 5 to 30 minutes and includes the following components:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Introduction (1-2 min): Briefly explain the session’s purpose (e.g., relaxation, focus).\n\n"
                    "Grounding (2-3 min): Guide participants to settle, breathe deeply, and become present.\n\n"
                    "Core Practice (5-20 min): Focus on mindfulness, breath awareness, body scan, or visualization.\n\n"
                    "Closing (1-2 min): Gradually return to the present with gentle movements and affirmations.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.white, size: 24),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          "→ Use a calm, soft voice and pause often\n"
                          "→ Encourage non-judgment and flexibility",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
