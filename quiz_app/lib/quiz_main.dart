import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_bank.dart';
import 'package:quiz_app/enums/screen.dart';
import 'package:quiz_app/views/quiz_question.dart';
import 'package:quiz_app/views/quiz_start.dart';
import 'package:quiz_app/views/quiz_summary.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});

  @override
  State<QuizMain> createState() {
    return _QuizMainState();
  }
}

class _QuizMainState extends State<QuizMain> {
  Screen _currentScreen = Screen.startScreen;

  final List<String> _answers = [];

  // Click on any answers
  void onClickAnswerQuestion(String answer) {
    _answers.add(answer);
    if (_answers.length == questionList.length) {
      setState(() {
        _currentScreen = Screen.summaryScreen;
      });
    }
  }

  // Click on start quiz button
  void onClickStartQuiz() {
    setState(() {
      _currentScreen = Screen.questionAnswerScreen;
    });
  }

  // Click on reset quiz button
  void onClickRetryQuiz() {
    setState(() {
      _answers.clear();
      _currentScreen = Screen.startScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.startScreen:
        return QuizStart(onClickStartQuiz: onClickStartQuiz);
      case Screen.questionAnswerScreen:
        return QuizQuestion(
          onClickAnswerQuestion: onClickAnswerQuestion,
        );
      case Screen.summaryScreen:
        return QuizSummary(
          onClickRetryQuiz: onClickRetryQuiz,
          answers: _answers,
        );
    }
  }
}
