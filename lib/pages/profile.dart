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
                          )
                        : Image.asset(
                            "images/profile.webp",
                            width: 90,
                            height: 90,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                buildCustomContainer("Name and Surname", nameController),
                const SizedBox(height: 10),
                buildCustomContainer("Preferences", preferencesController),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: isFormValid() ? Colors.pink : Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextButton(
            onPressed: isFormValid()
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile saved!')),
                    );
                  }
                : null,
            child: const Text(
              "Save",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom container widget with TextField
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
