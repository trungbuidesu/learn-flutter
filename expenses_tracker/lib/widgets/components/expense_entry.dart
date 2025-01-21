import 'package:expenses_tracker/enums/expense_category.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseEntry extends StatelessWidget {
  const ExpenseEntry({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final IconData displayIconData = getDisplayCategoryIconData(
        expense.category ?? ExpenseCategory.miscellaneous);

    return Card(
      color: Colors.purple.shade50,
      margin: EdgeInsets.only(bottom: 10),
      shadowColor: Colors.transparent,
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
                Icon(displayIconData),
                const SizedBox(
                  width: 5,
                ),
                Text(DateFormat("dd/MM/yyyy").format(expense.createdDate))
              ],
            )
          ],
        ),
      ),
    );
  }

  IconData getDisplayCategoryIconData(ExpenseCategory category) {
    final IconData displayIconData;
    switch (expense.category) {
      case ExpenseCategory.food:
        displayIconData = Icons.fastfood;
        break;
      case ExpenseCategory.entertainment:
        displayIconData = Icons.theater_comedy;
        break;
      case ExpenseCategory.health:
        displayIconData = Icons.local_hospital;
        break;
      case ExpenseCategory.travel:
        displayIconData = Icons.drive_eta;
        break;
      case ExpenseCategory.leisure:
        displayIconData = Icons.videogame_asset;
        break;
      case ExpenseCategory.utilities:
        displayIconData = Icons.settings;
        break;
      case ExpenseCategory.transport:
        displayIconData = Icons.emoji_transportation;
        break;
      default:
        displayIconData = Icons.help;
        break;
    }
    return displayIconData;
  }
}
