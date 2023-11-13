import 'package:flutter/material.dart';
import 'package:expense_harmony/widgets/expenses_list/expenses_list.dart';
import 'package:expense_harmony/models/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _documentedExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 229.00,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Plane ticket",
        amount: 1530.00,
        date: DateTime.now(),
        category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Expense chart"),
          Expanded(
            child: ExpensesList(_documentedExpenses),
          ),
        ],
      ),
    );
  }
}