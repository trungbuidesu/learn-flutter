import 'package:expenses_tracker/widgets/components/empty_expense.dart';
import 'package:expenses_tracker/widgets/components/expense_list.dart';
import 'package:expenses_tracker/data/expense_data.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expense_create.dart';
import 'package:flutter/material.dart';

List<Expense> expenses = List.of(expenseList);

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // Add new expense model to the list
  void _addNewExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  // Remove expense from the list
  void _removeExpense(Expense expense) {
    final int indexOfExpense = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Expense removed successfully."),
            const Spacer(),
            TextButton(
                onPressed: () => setState(() {
                      expenses.insert(indexOfExpense, expense);
                    }),
                child: Text("Undo"))
          ],
        )));
  }

  // Swap expense in the list using 2 indexes
  void _swapExpense(int firstIndex, int secondIndex) {
    Expense temp = expenses[firstIndex];
    expenses[firstIndex] = expenses[secondIndex];
    expenses[secondIndex] = temp;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Expense swapped successfully."),
            const Spacer(),
            TextButton(
                onPressed: () => setState(() {
                      Expense temp = expenses[firstIndex];
                      expenses[firstIndex] = expenses[secondIndex];
                      expenses[secondIndex] = temp;
                    }),
                child: Text("Undo"))
          ],
        )));
  }

  void _openAddExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builderContext) => ExpenseCreate(
              addNewExpense: _addNewExpense,
            ));
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
            onPressed: _openAddExpense,
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
            Expanded(
                child: expenses.isNotEmpty
                    ? ExpenseList(
                        expenses: expenses,
                        onRemoveExpense: _removeExpense,
                        onSwapExpense: _swapExpense,
                      )
                    : EmptyExpense()),
          ],
        ),
      ),
    );
  }
}
