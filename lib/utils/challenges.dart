import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:warsawa/model/challenge.dart';
import 'package:warsawa/utils/Challenge_Provider.dart'; // Import ChallengeProvider
import 'package:warsawa/model/challenge_page.dart';

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

  // Goals for tracking progress
  List<String> goals = ['Goal 1', 'Goal 2', 'Goal 3'];
  Map<String, bool> goalStatus = {
    'Goal 1': false,
    'Goal 2': false,
    'Goal 3': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6A1E55),
      appBar: AppBar(
        title: const Text(
          'Create a Challenge',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff6A1E55),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title input field
              _buildTextField(
                controller: _titleController,
                label: 'Challenge Title',
                hint: 'Enter the challenge title',
              ),
              const SizedBox(height: 20),

              // Description input field
              _buildTextField(
                controller: _descriptionController,
                label: 'Description',
                hint: 'Provide a detailed description',
                maxLines: 4,
              ),
              const SizedBox(height: 20),

              // Time Frame dropdown
              _buildDropdown(
                label: 'Time Frame',
                value: _selectedTimeFrame,
                items: timeFrames,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTimeFrame = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Difficulty dropdown
              _buildDropdown(
                label: 'Difficulty Level',
                value: _selectedDifficulty,
                items: difficulties,
                onChanged: (newValue) {
                  setState(() {
                    _selectedDifficulty = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Goals section with checkboxes
              const Text(
                'Goals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF34517D),
                ),
              ),
              const SizedBox(height: 10),
              ...goals.map((goal) {
                return CheckboxListTile(
                  title: Text(
                    goal,
                    style: const TextStyle(fontSize: 16),
                  ),
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
              const SizedBox(height: 20),

              // Progress bar
              _buildProgressBar(),

              const SizedBox(height: 30),

              // Submit Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF34517D),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _submitChallenge();
                  },
                  child: const Text(
                    'Create Challenge',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: const Color(0xFFEEF0FF),
      ),
    );
  }

  // Helper method to build dropdown fields
  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: const Color(0xFFEEF0FF),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  // Helper method to build the progress bar
  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Progress',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF34517D),
          ),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: _progress,
          minHeight: 10,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFA8C7FA)),
        ),
      ],
    );
  }

  void _submitChallenge() {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }

    Challenge challenge = Challenge(
      title: _titleController.text,
      description: _descriptionController.text,
      timeFrame: _selectedTimeFrame,
      difficulty: _selectedDifficulty,
      goalsStatus: goalStatus,
    );

    Provider.of<ChallengeProvider>(context, listen: false)
        .addChallenge(challenge);

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => challengepage(challenge: challenge),
      ),
    );
  }
}
