import 'package:flutter/material.dart';
import 'package:warsawa/pages/CustomAppBar.dart';
import 'package:warsawa/utils/buton.dart';

class discover extends StatefulWidget {
  const discover({super.key});

  @override
  State<discover> createState() => _discoverState();
}

class _discoverState extends State<discover> {
  final String title = "Warsawa";

  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff6A1E55),
      appBar: CustomAppBar(title: title),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05), // 5% of screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title Row
              Row(
                children: [
                  Icon(
                    Icons.search,
                    size: screenWidth * 0.08, // 8% of screen width
                    color: Colors.pinkAccent,
                  ),
                  SizedBox(width: screenWidth * 0.02), // 2% of screen width
                  Text(
                    "Discover",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.06, // 6% of screen width
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height

              // Expanded widget for the button
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, // 2% of screen height
                    horizontal: screenWidth * 0.05, // 5% of screen width
                  ),
                  child: buton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
