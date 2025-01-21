import 'package:expenses_tracker/enums/expense_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  DateTime? _selectedDate;
  ExpenseCategory? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final currentDate = DateTime.now();
    final firstDate =
        DateTime(currentDate.year - 1, currentDate.month, currentDate.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? currentDate,
        firstDate: firstDate,
        lastDate: currentDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _cancelCreateExpense() {
    Navigator.pop(context);
  }

  void _submitExpense() {
    bool isDataValid = true;
    String errorMessage = "";

    if (_titleController.text.trim().isEmpty) {
      isDataValid = false;
      errorMessage += "\n- Missing title data!";
    }

    double? amountValue = double.tryParse(_amountController.text.trim());
    if (amountValue == null || amountValue <= 0) {
      isDataValid = false;
      errorMessage += "\n- Missing amount data!";
    }

    if (_selectedDate == null) {
      isDataValid = false;
      errorMessage += "\n- Missing date data!";
    }

    if (!isDataValid) {
      showDialog(
          context: context,
          builder: (builderContext) => AlertDialog(
                title: Text("Error"),
                content:
                    Text("Please refer to the below error(s).$errorMessage"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(builderContext),
                      child: Text("Close")),
                  TextButton(
                      onPressed: () => Navigator.pop(builderContext),
                      child: Text("Ok"))
                ],
              ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefixText: "\$ ",
                  ),
                ),
              ),
              ElevatedButton.icon(
                  label: Text(
                    _selectedDate == null
                        ? "Select Date"
                        : DateFormat("dd/MM/yyyy").format(_selectedDate!),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _showDatePicker,
                  icon: Icon(Icons.calendar_month)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              DropdownButton(
                  focusColor: Colors.transparent,
                  underline: const SizedBox(),
                  value: _selectedCategory ?? ExpenseCategory.miscellaneous,
                  items: [
                    ...ExpenseCategory.values
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase()),
                            ))
                  ],
                  onChanged: (value) => {
                        setState(() {
                          if (value != null) {
                            _selectedCategory = value;
                          }
                        })
                      }),
              const Spacer(),
              ElevatedButton(
                  onPressed: _cancelCreateExpense,
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  onPressed: _submitExpense,
                  child: Text(
                    "Save expense",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
