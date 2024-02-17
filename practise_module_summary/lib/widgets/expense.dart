import 'package:flutter/material.dart';
import 'package:practise_module_summary/add_expense.dart';
import 'package:practise_module_summary/widgets/charts/chart.dart';
import 'package:practise_module_summary/widgets/expenses_list/expenses_list.dart';
import 'package:practise_module_summary/models_data/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expensesList = [
    Expense(
        title: "Burger",
        amount: 20.19,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Loki",
        amount: 3.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Murree",
        amount: 200.99,
        date: DateTime.now(),
        category: Category.travel)
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expensesList.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    print("This function is running successfully");
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(addExpense: _addExpense),
    );
  }

  void _removeItem(Expense expense) {
    int _removeExpenseIndex = _expensesList.indexOf(expense);
    setState(() {
      _expensesList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              _expensesList.insert(_removeExpenseIndex, expense);
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Welcome back"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            )
          ]),
      body: width < 600
          ? Column(
              children: [
                Chart(
                  expenses: _expensesList,
                ),
                Expanded(
                  child: ExpenseList(
                    expenses: _expensesList,
                    ondismissed: _removeItem,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _expensesList,
                  ),
                ),
                Expanded(
                  child: ExpenseList(
                    expenses: _expensesList,
                    ondismissed: _removeItem,
                  ),
                ),
              ],
            ),
    );
  }
}
