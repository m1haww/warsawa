import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsawa/pages/splash.dart';
import 'package:warsawa/utils/Challenge_Provider.dart';
import 'package:warsawa/utils/appprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => ChallengeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
