import 'package:flutter/material.dart';
import 'package:quiz_app/components/result_entry.dart';
import 'package:quiz_app/data/question_bank.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({
    super.key,
    required this.onClickRetryQuiz,
    required this.answers,
  });

  final void Function() onClickRetryQuiz;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    int totalCorrectAnswers = 0;
    int totalQuestions = questionList.length;

    for (int i = 0; i < questionList.length; i++) {
      if (answers[i] == questionList[i].correctAnswer) {
        totalCorrectAnswers += 1;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bạn trả lời đúng $totalCorrectAnswers trên tổng số $totalQuestions câu hỏi!",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 25),
          maxLines: 2,
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 600,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...questionList.map((item) => ResultEntry(
                    questionIndex: questionList.indexOf(item),
                    question: item.question,
                    answer: answers[questionList.indexOf(item)],
                    correctAnswer: item.correctAnswer))
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: onClickRetryQuiz,
          icon: Icon(Icons.refresh),
          style: IconButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 83, 0, 104)),
        )
      ],
    );
  }
}
