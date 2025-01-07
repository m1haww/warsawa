import 'package:flutter/material.dart';
import 'package:warsawa/utils/information_buton.dart';

class buton extends StatefulWidget {
  @override
  State<buton> createState() => _butonState();
}

class _butonState extends State<buton> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff6A1E55),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
          child: Column(
            children: [
              // Horizontally scrollable list of techniques
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTechniqueCard(
                        'Breathing', Colors.pink, screenWidth, screenHeight),
                    _buildTechniqueCard(
                        'Meditation', Colors.pink, screenWidth, screenHeight),
                    _buildTechniqueCard(
                        'Body Scan', Colors.pink, screenWidth, screenHeight),
                    _buildTechniqueCard('Mindful Walking', Colors.pink,
                        screenWidth, screenHeight),
                    _buildTechniqueCard('Visualization', Colors.pink,
                        screenWidth, screenHeight),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height

              // Vertically scrollable list of techniques
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ...[
                        'Breathing',
                        'Meditation',
                        'Body Scan',
                        'Mindful Walking',
                        'Visualization'
                      ].map((technique) {
                        return _buildVerticalTechniqueCard(
                            technique, screenWidth, screenHeight);
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechniqueCard(
      String technique, Color color, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => informationbuton(techniqueName: technique),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02), // 2% of screen width
        width: screenWidth * 0.4, // 40% of screen width
        height: screenHeight * 0.15, // 15% of screen height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            technique,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black54,
                  offset: Offset(1, 2),
                  blurRadius: 3,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalTechniqueCard(
      String technique, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => informationbuton(techniqueName: technique),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02), // 2% of screen height
        padding: EdgeInsets.all(screenWidth * 0.05), // 5% of screen width
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 32,
              color: Colors.white,
            ),
            SizedBox(width: screenWidth * 0.04), // 4% of screen width
            Expanded(
              child: Text(
                technique,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(1, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
