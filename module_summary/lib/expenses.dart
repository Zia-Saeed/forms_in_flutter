import 'package:flutter/material.dart';
import 'package:module_summary/widgets/add_expense.dart';
import 'package:module_summary/widgets/chart/char.dart';
import 'package:module_summary/widgets/expenses_list/expenses_list.dart';
// import 'package:module_summary/expenses.dart';
import 'package:module_summary/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 29.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Burger",
        amount: 15.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Murree",
        amount: 50.99,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // this will show popup window
      useSafeArea: true,
      // using usesafearea to prevent the widget to ovelap inside safearea like mobile camera
      context: context,
      isScrollControlled:
          true, // isScrollControlled making sure that the overlay takes fullscreen
      builder: (cxt) => NewExpense(
          addExpense: _addExpense), // then function should return widget.
    ); //context is automatically provided when we are in a state widget context is the position of widget in tree
    // buidler excepts function that and one parameter context. buidler context is different then the previow parameter.
  }

  void _removeExpense(Expense expense) {
    final expenseIndex =
        _registerExpenses.indexOf(expense); // getting index of removed items
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // this function will  clear the info message immediately.
    ScaffoldMessenger.of(
        //ScaffoldMessenger have various methods that that controlls UIs
        context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            _registerExpenses.insert(expenseIndex,
                expense); //adding expense again to the expense list
          },
        ),
      ),
    ); //showing and hiding UI have a of() methos and this method accepts context which is already present in state class
    //snackbar is just a info message on the screen and it wants a value that canbe created using Snackbar(content: ).
    // content which must be a widget
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    // print(MediaQuery.of(context).size.height);

    Widget mainContent = const Center(
      child: Text("No Expenses found. Start adding some! "),
    );
    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter expense Tracker"), actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon: const Icon(Icons.add),
        )
      ]),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registerExpenses),
                Expanded(
                  child: mainContent,
                ),
                // Text("Expenses List"),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registerExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
                // Text("Expenses List"),
              ],
            ),
    );
  }
}
