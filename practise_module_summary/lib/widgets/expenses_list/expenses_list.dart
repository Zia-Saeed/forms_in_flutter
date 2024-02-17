import 'package:flutter/material.dart';
import 'package:practise_module_summary/widgets/expenses_list/expense_item.dart';
import 'package:practise_module_summary/models_data/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.ondismissed});
  final void Function(Expense expense) ondismissed;
  final List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Colors.red.shade300,
        ),
        key: ValueKey(
          expenses[index],
        ),
        onDismissed: (direction) {
          ondismissed(expenses[index]);
        },
        child: ExpenseItems(expense: expenses[index]),
      ),
    );
  }
}
