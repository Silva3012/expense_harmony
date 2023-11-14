import 'package:flutter/material.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key});

  @override
  State<AddNewExpense> createState() {
    return _AddNewExpenseState();
  }
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // Close the modal
  void _closeModal() {
    Navigator.pop(context);
  }

  // Function for date picker
  void _currentDatePicker() {
    final today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    showDatePicker(
        context: context,
        initialDate: today,
        firstDate: firstDate,
        lastDate: today);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text("Enter your expense title"),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: const InputDecoration(
                  label: Text("Amount"),
                  prefixText: "R ",
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Select Date"),
                  IconButton(
                    onPressed: _currentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                print(_titleController.text);
                print(_amountController.text);
                // _closeModal();
              },
              child: const Text("Save"),
            ),
            const SizedBox(
              width: 10,
            ),
            OutlinedButton(
              onPressed: _closeModal,
              child: const Text("Cancel"),
            ),
          ],
        ),
      ]),
    );
  }
}
