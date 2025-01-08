import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsawa/pages/activities.dart';
import 'package:warsawa/utils/appprovider.dart';

// Define a Goal data model if not already defined
class Goal {
  final String goalText;
  bool isSaved; // Tracks whether the goal is saved

  Goal({required this.goalText, this.isSaved = false});
}

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  TextEditingController goalController = TextEditingController();

  @override
  void dispose() {
    goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text("Add new goal"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.calendar_today,
                        color: Colors.pinkAccent, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Activities",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05), // Adjusted space
                Container(
                  width: screenWidth * 0.9, // 90% of screen width
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          maxLines: 3,
                          controller: goalController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Enter your goal here",
                            hintStyle: TextStyle(color: Colors.white60),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pinkAccent),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                String goalText = goalController.text;
                                if (goalText.isNotEmpty) {
                                  // Add the goal to AppProvider
                                  Provider.of<AppProvider>(context,
                                          listen: false)
                                      .addGoal(
                                    Goal(goalText: goalText),
                                  );

                                  // Navigate to the activities page
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => activities(),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text("Save"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => activities(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text("Cancel"),
                            ),
                          ],
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
