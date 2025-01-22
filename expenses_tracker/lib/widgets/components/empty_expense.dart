import 'package:flutter/material.dart';

class EmptyExpense extends StatelessWidget {
  const EmptyExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "There is no expense",
      ),
    );
  }
}
