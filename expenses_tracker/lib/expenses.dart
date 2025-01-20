import 'package:expenses_tracker/components/expense_list.dart';
import 'package:expenses_tracker/data/expense_data.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> expenses = expenseList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to my page"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: ExpenseList(),),
    );
  }
}
