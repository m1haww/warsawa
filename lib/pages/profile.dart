import 'package:flutter/material.dart';
import 'package:warsawa/pages/CustomAppBar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String title = "Warsawa";

  // Controller for text fields
  final TextEditingController pictureController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController preferencesController = TextEditingController();

  File? _image;

  // Extracted function to check if the form is valid
  bool isFormValid() {
    return pictureController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        preferencesController.text.isNotEmpty;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    if (isFormValid()) {
      final String name = nameController.text;
      final String preferences = preferencesController.text;
      final String picturePath =
          _image != null ? _image!.path : 'No image selected';

      // Debugging output
      print('Profile Saved!');
      print('Name: $name');
      print('Preferences: $preferences');
      print('Image Path: $picturePath');

      // Show a message confirming that the profile is saved
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Profile saved!\nName: $name\nPreferences: $preferences\nImage: $picturePath'),
          duration:
              Duration(seconds: 3), // Optional duration for message visibility
        ),
      );

      // Optionally, clear the fields after saving
      setState(() {
        nameController.clear();
        preferencesController.clear();
        pictureController.clear();
        _image = null;
      });
    } else {
      // If the form is not valid, debug message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields before saving!'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6A1E55),
      appBar: CustomAppBar(title: title),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: ClipOval(
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 100, // Adjust image size
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "images/profile.webp",
                            width: 100, // Adjust image size
                            height: 100,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                buildCustomContainer("Name and Surname", nameController),
                const SizedBox(height: 10),
                buildCustomContainer("Preferences", preferencesController),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Save Profile',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomContainer(String text, TextEditingController controller) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink, width: 2),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: text,
                labelStyle: const TextStyle(color: Colors.pink),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              cursorColor: Colors.pink,
            ),
          ),
          const Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
            size: 18,
          ),
        ],
      ),
    );
  }
}
