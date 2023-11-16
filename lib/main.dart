import 'package:expense_harmony/widgets/expenses.dart';
import 'package:flutter/material.dart';

// Light mode color scheme
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 46, 132, 219),
);

// Dark mode color scheme
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(222, 46, 53, 76),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.secondaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.inversePrimary,
          margin: const EdgeInsets.all(9),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: kColorScheme.onSecondary,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 18,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
