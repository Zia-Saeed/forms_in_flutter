import 'package:flutter/material.dart';

enum Pr { urgent, normal, low }

class TodoItem extends StatelessWidget {
  const TodoItem(this.text, this.priority, {super.key});

  final String text;
  final Pr priority;

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if (priority == Pr.urgent) {
      icon = Icons.notifications_active;
    }

    if (priority == Pr.normal) {
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}
