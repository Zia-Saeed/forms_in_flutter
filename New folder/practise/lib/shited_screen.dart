import 'package:flutter/material.dart';
import 'package:practise/buttons.dart';
import 'package:practise/list_of_questions.dart';

class ShiftedScreen extends StatefulWidget {
  const ShiftedScreen({super.key});
  @override
  State<ShiftedScreen> createState() {
    return _ShiftedScreenState();
  }
}

class _ShiftedScreenState extends State<ShiftedScreen> {
  int question = 0;

  void nextQuestion() {
    setState(() {
      question++;
    });
  }

  @override
  Widget build(context) {
    final currentQuesion = questionlist[question];
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentQuesion.question,
                style: const TextStyle(color: Colors.brown),
              ),
              ...currentQuesion.getShuffledAnswer().map(
                (e) {
                  return Button(
                    text: e,
                    func: nextQuestion,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
