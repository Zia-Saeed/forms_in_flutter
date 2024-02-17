import 'package:flutter/material.dart';
import 'package:module_summary/models/expense.dart';
import 'package:module_summary/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          color: Theme.of(context).colorScheme.error.withOpacity(.6),
        ), // background property wants a widget
        key: ValueKey(
          expenses[index],
        ), // the key define in contructor of the class above and A key is need to tell the flutter to uniquely identify a widget and data associated with the widget. and such a key can be create using ValueKey()
        // a key is need to make sure that the correct data is deleted or dismissible.
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        }, //on swipping what should we do.
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ), // flutter give the widget that should be wrapped around the widget for sliding the widget
    );
  }
}
