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

  void _openCreateExpenseModal() {
    showModalBottomSheet(
        context: context, builder: (builderCtx) => ExpenseCreate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to my page"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(onPressed: _openCreateExpenseModal, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: Card(
                    margin: EdgeInsets.all(0),
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 50,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 50,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(Icons.fastfood),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 50,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(Icons.drive_eta),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 50,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(Icons.theater_comedy),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 50,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(Icons.local_hospital),
                          ],
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: ExpenseList()),
            ],
          ),
        ),
      ),
    );
  }
}
