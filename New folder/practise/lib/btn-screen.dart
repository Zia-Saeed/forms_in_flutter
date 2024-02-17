import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import "package:practise/shited_screen.dart";

class BtnScreen extends StatelessWidget {
  const BtnScreen({super.key, required this.changeState});
  final void Function() changeState;

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepPurpleAccent),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Shift to next Screen."),
          onPressed: changeState,
        ),
      ),
    );
  }
}
