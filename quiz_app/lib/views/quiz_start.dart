import 'package:flutter/material.dart';

class QuizStart extends StatelessWidget {
  const QuizStart({super.key, required this.onClickStartQuiz});

  final Function() onClickStartQuiz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Bài kiểm tra sự hiểu biết về Việt Nam",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onClickStartQuiz,
            label: Text("Trắc nghiệm Tiếng Việt"),
            icon: Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
