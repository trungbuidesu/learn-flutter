import 'package:expenses_tracker/enums/expense_category.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

    return Expanded(
      child: Card(
        color: Colors.purple.shade50,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${expense.amount.toStringAsFixed(2)}\$'),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  displayIcon,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(DateFormat("dd/MM/yyyy").format(expense.createdDate))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
