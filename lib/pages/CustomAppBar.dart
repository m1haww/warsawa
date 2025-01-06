import 'package:flutter/material.dart';
import 'package:warsawa/pages/activities.dart';
import 'package:warsawa/pages/discover.dart';
import 'package:warsawa/pages/home.dart';
import 'package:warsawa/pages/profile.dart';
import 'package:warsawa/pages/resources.dart';
import 'package:warsawa/pages/settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Text(
          "W",
          style: TextStyle(
            color: Colors.pink,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 24),
      ),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.black),
          color: Colors.pink.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (value) => _navigateTo(context, value),
          itemBuilder: (context) => [
            _buildPopupMenuItem('Home', 'Home'),
            _buildPopupMenuItem('Discover', 'Discover'),
            _buildPopupMenuItem('Activities', 'Activities'),
            _buildPopupMenuItem('Resources', 'Resources'),
            _buildPopupMenuItem('Profile', 'Profile'),
            _buildPopupMenuItem('Settings', 'Settings'),
          ],
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String value, String title) {
    return PopupMenuItem<String>(
      value: value,
      height: 50,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String value) {
    switch (value) {
      case 'Home':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 'Discover':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Discover()),
        );
        break;
      case 'Activities':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => activities()),
        );
        break;
      case 'Resources':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => resources()),
        );
        break;
      case 'Profile':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
        break;
      case 'Settings':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => settings()),
        );
        break;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
