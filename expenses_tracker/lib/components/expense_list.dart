import 'package:expenses_tracker/components/expense_entry.dart';
import 'package:expenses_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) =>
            ExpenseEntry(expense: expenseList[index]),
        itemCount: expenseList.length,
      ),
    );
  }
}
