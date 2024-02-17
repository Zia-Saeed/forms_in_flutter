import 'package:demo_app/keys/checkable_todo_item.dart';
import 'package:demo_app/keys/todo_item.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';

// import 'package:flutter_internals/keys/todo_item.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  // final Priority priority;
  final Pr priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todos = [
    const Todo(
      'Learn Flutter',
      Pr.urgent,
    ),
    const Todo(
      'Practice Flutter',
      Pr.normal,
    ),
    const Todo(
      'Explore other courses',
      Pr.low,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // for (final todo in _orderedTodos) TodoItem(todo.text, todo.priority),
              for (final todo in _orderedTodos)
                CheckableTodoItem(
                  key: ObjectKey(
                      todo), // we can alse use objectkey and it accepts object

                  // key: ValueKey(
                  // todo.text,
                  todo.text,
                  todo.priority,
                ), // valuekey its a dynamic type wants a value and value is internally be used a identification criteria a key value should be uniques and directly connected to your data
              // value key is light weight so use it offen
            ],
          ),
        ),
      ],
    );
  }
}
