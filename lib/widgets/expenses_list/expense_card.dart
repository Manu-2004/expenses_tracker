import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(this.exp, {super.key});

  final Expense exp;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(
            exp.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
          SizedBox(height: 14),
          Row(
            
            children: [SizedBox(width: 10),
              Text('\$ ${exp.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
              children: [
                Icon(categoryIcons[exp.category],
                  ),
                SizedBox(width: 10),
                Text(exp.formattedDate)
              ],
              ),SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}
