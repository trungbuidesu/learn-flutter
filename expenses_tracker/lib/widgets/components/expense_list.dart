import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/components/expense_entry.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // hide scrollbar
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          child: ExpenseEntry(expense: expenses[index]),
          onDismissed: (direction) => onRemoveExpense(expenses[index]),
        ),
        itemCount: expenses.length,
      ),
    );
  }
}
