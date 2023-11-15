import 'package:expense_harmony/widgets/add_new_expense.dart';
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

  // This function opens the modal to add an expense
  void _openAddExpenseModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddNewExpense(_addExpense),
    );
  }

  // This function adds an expense
  void _addExpense(Expense expense) {
    setState(() {
      _documentedExpenses.add(expense);
    });
  }

  // This function removes an expense
  void _deleteExpense(Expense expense) {
    setState(() {
      _documentedExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Harmony"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseModal, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text("Expense chart"),
          Expanded(
            child: ExpensesList(_documentedExpenses, _deleteExpense),
          ),
        ],
      ),
    );
  }
}
