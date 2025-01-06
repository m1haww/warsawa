class Challenge {
  final String title;
  final String description;
  final String timeFrame;
  final String difficulty;
  final Map<String, bool> goalsStatus;

  Challenge({
    required this.title,
    required this.description,
    required this.timeFrame,
    required this.difficulty,
    required this.goalsStatus,
  });
}
