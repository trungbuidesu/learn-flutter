import 'package:expenses_tracker/widgets/components/expense_entry.dart';
import 'package:expenses_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // hide scrollbar
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) =>
            ExpenseEntry(expense: expenseList[index]),
        itemCount: expenseList.length,
      ),
    );
  }
}
