import 'package:expenses_tracker/enums/expense_category.dart';
import 'package:expenses_tracker/models/expense.dart';

List<Expense> expenseList = [
  Expense(
    title: 'Lunch',
    amount: 15.50,
    createdDate: DateTime.now().subtract(Duration(days: 1)),
    category: ExpenseCategory.food,
  ),
  Expense(
    title: 'Bus ticket',
    amount: 2.00,
    createdDate: DateTime.now().subtract(Duration(days: 2)),
    category: ExpenseCategory.transport,
  ),
  Expense(
    title: 'Movie ticket',
    amount: 10.00,
    createdDate: DateTime.now().subtract(Duration(days: 3)),
    category: ExpenseCategory.entertainment,
  ),
  Expense(
    title: 'Electricity bill',
    amount: 45.75,
    createdDate: DateTime.now().subtract(Duration(days: 4)),
    category: ExpenseCategory.utilities,
  ),
  Expense(
    title: 'Doctor appointment',
    amount: 30.00,
    createdDate: DateTime.now().subtract(Duration(days: 5)),
    category: ExpenseCategory.health,
  ),
  Expense(
    title: 'Coffee',
    amount: 3.50,
    createdDate: DateTime.now().subtract(Duration(days: 6)),
    category: ExpenseCategory.food,
  ),
  Expense(
    title: 'Gym membership',
    amount: 25.00,
    createdDate: DateTime.now().subtract(Duration(days: 7)),
    category: ExpenseCategory.health,
  ),
  Expense(
    title: 'Internet bill',
    amount: 50.00,
    createdDate: DateTime.now().subtract(Duration(days: 8)),
    category: ExpenseCategory.utilities,
  ),
  Expense(
    title: 'Movie rental',
    amount: 5.00,
    createdDate: DateTime.now().subtract(Duration(days: 9)),
    category: ExpenseCategory.entertainment,
  ),
  Expense(
    title: 'Miscellaneous purchase',
    amount: 7.20,
    createdDate: DateTime.now().subtract(Duration(days: 10)),
    category: ExpenseCategory.miscellaneous,
  ),
];
