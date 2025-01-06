import 'package:flutter/material.dart';
import 'package:warsawa/pages/CustomAppBar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    String title = 'Warsawa';

    Future.delayed(const Duration(seconds: 1), () async {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomAppBar(
              title: title,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
