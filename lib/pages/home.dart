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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff6A1E55),
      appBar: const CustomAppBar(title: title),
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _showText = !_showText;
                });
              },
              child: buildCustomRow("Daily Overview", width, height),
            ),
            if (_showText) ...[
              SizedBox(height: height * 0.02),
              buildTextSection(width, height),
            ],
            SizedBox(height: height * 0.02),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showMotivation =
                      !_showMotivation; // Toggle Motivation content
                });
              },
              child: buildCustomRow("Daily Motivation", width, height),
            ),
            if (_showMotivation) ...[
              SizedBox(height: height * 0.02),
              buildMotivationSection(width, height),
            ],
          ],
        ),
      ),
    );
  }

  // Function to create each row with an icon, text, and arrow
  Widget buildCustomRow(String label, double width, double height) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: height * 0.04,
          color: Colors.black,
        ),
        SizedBox(width: width * 0.05),
        Expanded(
          child: Container(
            height: height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.pink),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: Text(
                    label,
                    style:
                        TextStyle(fontSize: height * 0.02, color: Colors.black),
                  ),
                ),
                Icon(
                  Icons.arrow_back_ios,
                  size: height * 0.025,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextSection(double width, double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: width * 0.005,
            blurRadius: width * 0.02,
            offset: Offset(0, height * 0.003),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoItem("Steps taken", Icons.directions_walk, width, height),
          SizedBox(height: height * 0.02),
          _buildInfoItem(
              "Mood score", Icons.sentiment_satisfied_alt, width, height),
          SizedBox(height: height * 0.02),
          _buildInfoItem("Hydration level", Icons.water_damage, width, height),
        ],
      ),
    );
  }

  // Motivation specific section
  Widget buildMotivationSection(double width, double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 169, 191),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            spreadRadius: width * 0.005,
            blurRadius: width * 0.02,
            offset: Offset(0, height * 0.003),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoItem("Motivation Level", Icons.star, width, height),
          SizedBox(height: height * 0.02),
          _buildInfoItem("Inspiration", Icons.lightbulb, width, height),
          SizedBox(height: height * 0.02),
          _buildInfoItem("Focus", Icons.forum, width, height),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      String label, IconData icon, double width, double height) {
    return Row(
      children: [
        Icon(icon, color: Colors.pink, size: height * 0.03),
        SizedBox(width: width * 0.02),
        Text(
          label,
          style: TextStyle(
            fontSize: height * 0.02,
            fontWeight: FontWeight.w600,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}
