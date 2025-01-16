import 'package:expenses_tracker/components/expense_entry.dart';
import 'package:expenses_tracker/data/expense_data.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) =>
          ExpenseEntry(expense: expenseList[index]),
      prototypeItem: ExpenseEntry(
          expense: Expense(
              title: "Unititled", amount: 0.00, createdDate: DateTime.now())),
      itemCount: expenseList.length,
    );
  }
}
