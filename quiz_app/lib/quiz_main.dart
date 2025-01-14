import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_bank.dart';
import 'package:quiz_app/enums/screen.dart';
import 'package:quiz_app/views/quiz_question.dart';
import 'package:quiz_app/views/quiz_start.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});

  @override
  State<QuizMain> createState() {
    return _QuizMainState();
  }
}

class _QuizMainState extends State<QuizMain> {
  Screen currentScreen = Screen.startScreen;

  final List<String> answers = [];

  // Click on any answers
  void onClickAnswerQuestion(String answer) {
    answers.add(answer);
    if (answers.length == questionList.length) {
      setState(() {
        currentScreen = Screen.summaryScreen;
      });
    }
  }

  // Click on start quiz button
  void onClickStartQuiz() {
    setState(() {
      if (currentScreen == Screen.startScreen) {
        currentScreen = Screen.questionAnswerScreen;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentScreen == Screen.startScreen) {
      return QuizStart(onClickStartQuiz: onClickStartQuiz);
    } else if (currentScreen == Screen.questionAnswerScreen) {
      return QuizQuestion(
        onClickAnswerQuestion: onClickAnswerQuestion,
      );
    } else if (currentScreen == Screen.summaryScreen) {
      return Text("this is summary");
    } else {
      return Text("No screen found");
    }
  }
}
