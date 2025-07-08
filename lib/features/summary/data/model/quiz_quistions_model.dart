class QuizQuistionsModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuistionsModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}
