import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({super.key, required this.onClickRetryQuiz});

  final void Function() onClickRetryQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onClickRetryQuiz,
          icon: Icon(Icons.refresh),
          style: IconButton.styleFrom(foregroundColor: Colors.white),
        )
      ],
    );
  }
}
