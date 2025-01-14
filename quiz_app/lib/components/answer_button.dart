import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      required this.label,
      required this.onClick,
      this.marginTop,
      this.marginBottom});

  final Function() onClick;
  final String label;
  final double? marginTop;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (marginTop != null)
          SizedBox(
            height: marginTop,
          ),
        ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(label),
        ),
        if (marginBottom != null)
          SizedBox(
            height: marginBottom,
          ),
      ],
    );
  }
}
