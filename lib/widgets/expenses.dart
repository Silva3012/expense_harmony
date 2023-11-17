import 'package:expense_harmony/widgets/add_new_expense.dart';
import 'package:expense_harmony/widgets/chart/chart.dart';
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
  final List<Expense> _documentedExpenses = [];

  // This function opens the modal to add an expense
  void _openAddExpenseModal() {
    showModalBottomSheet(
      useSafeArea: true,
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
    final expenseIndex = _documentedExpenses.indexOf(expense);

    setState(() {
      _documentedExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted."),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _documentedExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget homeScreen = const Center(
      child: Text("No expenses to display. Start adding some!"),
    );

    if (_documentedExpenses.isNotEmpty) {
      homeScreen = ExpensesList(_documentedExpenses, _deleteExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Harmony"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseModal, icon: const Icon(Icons.add)),
        ],
      ),
      body: width < 500
          ? Column(
              children: [
                Chart(_documentedExpenses),
                Expanded(
                  child: homeScreen,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(_documentedExpenses),
                ),
                Expanded(
                  child: homeScreen,
                ),
              ],
            ),
    );
  }
}
