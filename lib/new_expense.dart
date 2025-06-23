import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_tracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  //final void Function(String title, double amount, DateTime date) onAddExpense;
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;
  ExpenseCategory _selectedCategory = ExpenseCategory.food;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitData() {
    final enteredTitle = titleController.text.trim();
    final enteredAmount = double.tryParse(amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Invalid Input'),
              content: Text('Please enter valid title, amount and date.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('Ok'),
                ),
              ],
            );
          });
      return;
    }
    widget.onAddExpense(Expense(
          title: titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory));
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16.0, 46.0, 16.0, 0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('Title'))),
            Row(children: [
              Expanded(
                child: TextField(
                    controller: amountController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text('Amount'), prefixText: '\$ ')),
              ),
              SizedBox(
                width: 26,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text((_selectedDate == null)
                    ? 'No Date Chosen'
                    : '${formatter.format(_selectedDate!)}'),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: Icon(Icons.calendar_month),
                )
              ])
            ]),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: ExpenseCategory.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                const Spacer(),
                ElevatedButton(
                    onPressed: _submitData, child: Text('Save Expense'))
              ],
            )
          ],
        ));
  }
}
