import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsawa/pages/CustomAppBar.dart';
import 'package:warsawa/utils/GoalPage.dart';
import 'package:warsawa/utils/appprovider.dart';
import 'package:warsawa/utils/challenges.dart';

class activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = "Warsawa";
    final goalList = Provider.of<AppProvider>(context).goalList;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff6A1E55),
      appBar: CustomAppBar(title: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row
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
              SizedBox(height: screenHeight * 0.02), // 2% of screen height

              // Set Your Goals Section
              Container(
                padding:
                    EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Set your goals here:",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                        height: screenHeight * 0.01), // 1% of screen height
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => GoalPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "+ Add a new goal",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: screenHeight * 0.03), // Increased spacing after goals

              // Challenge Cards Section
              Container(
                width: screenWidth, // Full screen width
                child: Column(
                  children: [
                    _buildChallengeCard(
                      title: "30-Day Step Challenge:",
                      description: "Walk 10,000 steps daily",
                    ),
                    SizedBox(
                        height: screenHeight * 0.02), // 2% of screen height
                    _buildChallengeCard(
                      title: "Plank Challenge:",
                      description: "Increase your plank hold time each day",
                    ),
                    SizedBox(
                        height: screenHeight * 0.02), // 2% of screen height
                    _buildChallengeCard(
                      title: "No Sugar Challenge:",
                      description: "Avoid added sugars for 7, 14, or 30 days",
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: screenHeight *
                      0.02), // Increased spacing after challenges

              Consumer<AppProvider>(
                builder: (context, appProvider, child) {
                  if (appProvider.goalList.isEmpty) {
                    return Center(
                      child: Text(
                        'No goals added yet!',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: appProvider.goalList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final goal = appProvider.goalList[index];

                      return Column(
                        children: [
                          Container(
                            width: screenWidth, // Full screen width
                            padding: EdgeInsets.all(
                                screenWidth * 0.04), // 4% of screen width
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Goal: ${goal.goalText}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: screenHeight *
                                  0.02), // Adds space between the containers
                        ],
                      );
                    },
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.02), // 2% of screen height

              // Set challenges Row Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.play_arrow,
                    size: 30,
                    color: Colors.pink,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Challenges(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Set challenges",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeCard(
      {required String title, required String description}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
