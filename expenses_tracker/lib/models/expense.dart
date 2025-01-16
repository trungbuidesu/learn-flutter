import 'package:expenses_tracker/enums/expense_category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime createdDate;
  final ExpenseCategory? category;

  Expense(
      {required this.title,
      required this.amount,
      required this.createdDate,
      this.category})
      : id = uuid.v4();
}
