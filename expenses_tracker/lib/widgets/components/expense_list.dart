import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/components/expense_entry.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(
      {super.key,
      required this.expenses,
      required this.onRemoveExpense,
      required this.onSwapExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  final void Function(int firstIndex, int secondIndex) onSwapExpense;

  @override
  State<StatefulWidget> createState() {
    return ExpenseListState();
  }
}

class ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // hide scrollbar
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) => Dismissible(
          direction: DismissDirection.horizontal,
          key: ValueKey(widget.expenses[index]),
          child: Draggable(
              affinity: Axis.vertical,
              childWhenDragging: const SizedBox(
                height: 85,
              ),
              feedback: SizedBox(
                height: 85,
                width: MediaQuery.of(context).size.width,
                child: ExpenseEntry(expense: widget.expenses[index]),
              ),
              data: ExpenseEntry(expense: widget.expenses[index]),
              child: Column(
                children: [
                  DragTarget<ExpenseEntry>(
                    builder: (context, accepted, rejected) {
                      return ExpenseEntry(expense: widget.expenses[index]);
                    },
                    onAcceptWithDetails:
                        (DragTargetDetails<ExpenseEntry> details) {
                      setState(() {
                        widget.onSwapExpense(
                            widget.expenses.indexOf(details.data.expense),
                            index);
                      });
                    },
                  )
                ],
              )),
          onDismissed: (direction) =>
              widget.onRemoveExpense(widget.expenses[index]),
        ),
        itemCount: widget.expenses.length,
      ),
    );
  }
}
