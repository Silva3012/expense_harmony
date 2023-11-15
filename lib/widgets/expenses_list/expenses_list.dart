import 'package:expense_harmony/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_harmony/models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, this.onDeleteExpense, {super.key});

  final List<Expense> expenses;
  final void Function(Expense expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onDeleteExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
