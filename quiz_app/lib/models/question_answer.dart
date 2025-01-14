class QuestionAnswer {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  const QuestionAnswer({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  List<String> getShuffledAnswers() {
    final clonedAnswers = List.of(answers);
    clonedAnswers.shuffle();
    return clonedAnswers;
  }
}
