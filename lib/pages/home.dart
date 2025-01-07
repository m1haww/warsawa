import 'package:flutter/material.dart';
import 'package:warsawa/pages/CustomAppBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showText = false;
  bool _showMotivation = false; // For Motivation content toggle

  @override
  Widget build(BuildContext context) {
    const String title = "Warsawa";
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff6A1E55),
      appBar: const CustomAppBar(title: title),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _showText = !_showText;
                });
              },
              child: buildCustomRow("Daily Overview"),
            ),
            if (_showText) ...[const SizedBox(height: 20), buildTextSection()],
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showMotivation =
                      !_showMotivation; // Toggle Motivation content
                });
              },
              child: buildCustomRow("Daily Motivation"),
            ),
            if (_showMotivation) ...[
              const SizedBox(height: 20),
              buildMotivationSection(),
            ],
          ],
        ),
      ),
    );
  }

  // Function to create each row with an icon, text, and arrow
  Widget buildCustomRow(String label) {
    final height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 30,
          color: Colors.black,
        ),
        const SizedBox(width: 20),
        Container(
          width: height * 0.4,
          height: height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.pink),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTextSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoItem("Steps taken", Icons.directions_walk),
          const SizedBox(height: 16),
          _buildInfoItem("Mood score", Icons.sentiment_satisfied_alt),
          const SizedBox(height: 16),
          _buildInfoItem("Hydration level", Icons.water_damage),
        ],
      ),
    );
  }

  // Motivation specific section
  Widget buildMotivationSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 169, 191),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoItem("Motivation Level", Icons.star),
          const SizedBox(height: 16),
          _buildInfoItem("Inspiration", Icons.lightbulb),
          const SizedBox(height: 16),
          _buildInfoItem("Focus", Icons.forum),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.pink, size: 24),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}
