import 'package:flutter/cupertino.dart';
import 'package:warsawa/utils/GoalPage.dart';

class AppProvider extends ChangeNotifier {
  final List<Goal> goalList = [];

  // Add a new goal
  void addGoal(Goal goal) {
    goalList.add(goal);
    notifyListeners();
  }

  // Toggle the saved status of a goal
  void toggleSavedStatus(int index) {
    goalList[index].isSaved = !goalList[index].isSaved;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Remove a goal
  void removeGoal(int index) {
    goalList.removeAt(index);
    notifyListeners(); // Notify listeners to update the UI
  }
}
