import 'package:expense_harmony/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 46, 132, 219),
);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimary,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
      ),
      home: const Expenses(),
    ),
  );
}
