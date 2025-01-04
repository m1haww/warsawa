import 'package:flutter/material.dart';
import 'package:warsawa/pages/discover.dart';

class home extends StatelessWidget {
  final String title;
  final Widget child;

  const home({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: child,
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String value, String title) {
    return PopupMenuItem<String>(
      value: value,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String value) {
    switch (value) {
      case 'Home':
        Navigator.pop(context);

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
          MaterialPageRoute(builder: (context) => const Discover()),
        );
        break;
      case 'Resources':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Discover()),
        );
        break;
      case 'Profile':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Discover()),
        );
        break;
      case 'Settings':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Discover()),
        );
        break;
    }
  }
}
