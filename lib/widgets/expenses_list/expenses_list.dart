import 'package:expenses_tracker/widgets/expenses_list/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
            color: Theme.of(context).colorScheme.error,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            child: Icon(Icons.delete, color: Colors.white)),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpenseCard(expenses[index]),
      ),
    );
  }
}
