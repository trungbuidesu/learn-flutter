import 'package:expenses_tracker/widgets/components/expense_list.dart';
import 'package:expenses_tracker/data/expense_data.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expense_create.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = expenseList;

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (builderContext) => ExpenseCreate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
            style: IconButton.styleFrom(foregroundColor: Colors.black),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(child: ExpenseList()),
          ],
        ),
      ),
    );
  }
}
