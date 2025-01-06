// challenge_provider.dart
import 'package:flutter/material.dart';
import 'package:warsawa/model/challenge.dart';

class ChallengeProvider with ChangeNotifier {
  List<Challenge> _challenges = [];

  List<Challenge> get challenges => _challenges;

  void addChallenge(Challenge challenge) {
    _challenges.add(challenge);
    notifyListeners(); // notifică ascultătorii când lista se schimbă
  }
}
