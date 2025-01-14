import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/question_bank.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key, required this.onClickAnswerQuestion});

  final Function(String answer) onClickAnswerQuestion;

  @override
  State<QuizQuestion> createState() {
    return _QuizQuestionState();
  }
}

class _QuizQuestionState extends State<QuizQuestion> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onClickAnswerQuestion(answer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questionList[currentQuestionIndex].question,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...questionList[currentQuestionIndex]
                .getShuffledAnswers()
                .map((item) => AnswerButton(
                      label: item,
                      onClick: () => answerQuestion(item),
                      marginBottom: 20,
                    ))
          ],
        ),
      ),
    );
  }
}
