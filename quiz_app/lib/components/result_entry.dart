import 'package:flutter/material.dart';

class ResultEntry extends StatelessWidget {
  const ResultEntry(
      {super.key,
      required this.questionIndex,
      required this.question,
      required this.answer,
      required this.correctAnswer});

  final int questionIndex;
  final String question;
  final String answer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = false;

    if (answer == correctAnswer) {
      isCorrectAnswer = true;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isCorrectAnswer ? Colors.blueAccent : Colors.redAccent),
                padding: EdgeInsets.all(20),
                child: Text(
                  "${questionIndex + 1}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      answer,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(correctAnswer,
                        style: TextStyle(
                            color: isCorrectAnswer
                                ? Colors.white
                                : Colors.redAccent,
                            fontSize: 15))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
