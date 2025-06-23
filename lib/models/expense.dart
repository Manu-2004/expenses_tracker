import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum ExpenseCategory {
  food,
  travel,
  leisure,
  work,
  other,
}

const categoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.travel: Icons.flight,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
  ExpenseCategory.other: Icons.question_mark,
};

class Expense{

  Expense({
    required this.title,
    required this.amount,
    required this.date,required this.category,
  }) : id = uuid.v4();


  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return formatter.format(date);
  }
}
class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expensesList});

  ExpenseBucket.category({
    required ExpenseCategory category,
    required List<Expense> allExpenses,
  })  : category = category,
        expensesList = allExpenses.where((expense) => expense.category == category).toList();

  final List<Expense> expensesList;
  final ExpenseCategory category;

  double get totalExpense {
    double sum = 0.0;
   for (final exp in expensesList) {
        sum += exp.amount;
    }
    return sum;
  }
}
