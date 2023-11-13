import 'package:expense_harmony/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_harmony/models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, {super.key});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}
