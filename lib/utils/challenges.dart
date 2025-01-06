import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsawa/model/challenge.dart';
import 'package:warsawa/model/challenge_page.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:warsawa/utils/Challenge_Provider.dart'; // Import ChallengeProvider

class Challenges extends StatefulWidget {
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedTimeFrame = 'Daily';
  String _selectedDifficulty = 'Easy';
  double _progress = 0.0;

  List<String> timeFrames = ['Daily', 'Weekly', 'Monthly'];
  List<String> difficulties = ['Easy', 'Medium', 'Hard'];

  // List to hold goals for tracking (checkboxes)
  List<String> goals = ['Goal 1', 'Goal 2', 'Goal 3'];
  Map<String, bool> goalStatus = {
    'Goal 1': false,
    'Goal 2': false,
    'Goal 3': false,
  };

  void _submitChallenge() {
    // Logic to handle the creation of the challenge
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Challenge Created!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a Challenge')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title input field
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Challenge Title'),
              ),
              SizedBox(height: 10),

              // Description input field
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 10),

              // Time Frame dropdown
              DropdownButtonFormField<String>(
                value: _selectedTimeFrame,
                decoration: InputDecoration(labelText: 'Time Frame'),
                items: timeFrames.map((timeFrame) {
                  return DropdownMenuItem<String>(
                    value: timeFrame,
                    child: Text(timeFrame),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTimeFrame = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),

              // Difficulty dropdown
              DropdownButtonFormField<String>(
                value: _selectedDifficulty,
                decoration: InputDecoration(labelText: 'Difficulty Level'),
                items: difficulties.map((difficulty) {
                  return DropdownMenuItem<String>(
                    value: difficulty,
                    child: Text(difficulty),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedDifficulty = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),

              // Goals section (checkboxes)
              Text('Goals:'),
              ...goals.map((goal) {
                return CheckboxListTile(
                  title: Text(goal),
                  value: goalStatus[goal],
                  onChanged: (bool? value) {
                    setState(() {
                      goalStatus[goal] = value!;
                      _progress =
                          goalStatus.values.where((status) => status).length /
                              goalStatus.length;
                    });
                  },
                );
              }).toList(),
              SizedBox(height: 10),

              // Progress bar
              LinearProgressIndicator(
                value: _progress,
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 20),

              // Submit Button
              GestureDetector(
                onTap: () {
                  print(
                      "Button pressed!"); // Add this line to see if the button is being pressed
                  // Create a Challenge object with the entered data
                  Challenge challenge = Challenge(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    timeFrame: _selectedTimeFrame,
                    difficulty: _selectedDifficulty,
                    goalsStatus: goalStatus,
                  );

                  // Add challenge to the provider
                  Provider.of<ChallengeProvider>(context, listen: false)
                      .addChallenge(challenge);

                  // Navigate to the ChallengePage with the newly created challenge
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => challengepage(
                        challenge: challenge,
                      ),
                    ),
                  );
                },
                child: ElevatedButton(
                  onPressed: _submitChallenge,
                  child: Text('Create Challenge'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
