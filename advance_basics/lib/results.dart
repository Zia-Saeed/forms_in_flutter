import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:advance_basics/date/questions.dart';
import 'package:advance_basics/question_summary.dart';
// import 'package:advance_basics/quiz.dart';
// import 'package:advance_basics/date/questions.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.func,
    required this.answerList,
    required this.correctAnswer,
  });
  final void Function() func;
  final List<String> answerList;
  final result = "false";
  final int correctAnswer;

  List<Map<String, Object>> checkAnswers() {
    // creating list of dictionarries key has String type and Value has object type
    final List<Map<String, Object>> summary = [];
    //for loops in dart
    for (var i = 0; i < questions.length; i++) {
      summary.add(
        {
          "questions_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": answerList[i],
          "color":
              (questions[i].answers[0] == answerList[i]) ? "correct" : "wrong",
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $correctAnswer out of ${questions.length} questions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 206, 168, 220),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(
              summaryData: checkAnswers(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Column(),
            TextButton.icon(
              onPressed: func,
              icon: const Icon(
                Icons.replay_rounded,
                color: Color.fromARGB(255, 229, 220, 220),
              ),
              label: const Text(
                "Restart quiz",
                style: TextStyle(
                  color: Color.fromARGB(255, 229, 220, 220),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
