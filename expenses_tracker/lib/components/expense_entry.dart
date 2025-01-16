import 'package:expenses_tracker/enums/expense_category.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseEntry extends StatelessWidget {
  const ExpenseEntry({Key? key, required this.expense}) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final Icon displayIcon;

    switch (expense.category) {
      case ExpenseCategory.food:
        displayIcon = Icon(Icons.fastfood);
        break;
      default:
        displayIcon = Icon(Icons.help);
        break;
    }

    return SizedBox(
      // width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(expense.title),
            Text('${expense.amount}'),
            displayIcon,
            Text('${expense.createdDate}')
          ],
        ),
      ),
    );
  }
}
