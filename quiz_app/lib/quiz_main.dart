import 'package:flutter/material.dart';
import 'package:quiz_app/views/quiz_start.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});

  @override
  State<QuizMain> createState() {
    return _QuizMainState();
  }
}

class _QuizMainState extends State<QuizMain> {
  @override
  Widget build(BuildContext context) {
    return QuizStart(onClickStartQuiz: () {});
  }
}
