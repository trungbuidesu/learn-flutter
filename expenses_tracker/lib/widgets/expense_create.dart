import 'package:flutter/material.dart';

class ExpenseCreate extends StatefulWidget {
  const ExpenseCreate({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpenseCreateState();
  }
}

class _ExpenseCreateState extends State<ExpenseCreate> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _showDatePicker() {
    final currentDate = DateTime.now();
    final firstDate =
        DateTime(currentDate.year - 1, currentDate.month, currentDate.day);
    showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: firstDate,
        lastDate: currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text("Amount"),
              prefixText: "\$ ",
            ),
          ),
          IconButton(
              onPressed: _showDatePicker, icon: Icon(Icons.calendar_month)),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Press me"))
        ],
      ),
    );
  }
}
