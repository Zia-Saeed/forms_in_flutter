// import "dart:ffi";

import 'package:flutter/material.dart';
import "package:advance_basics/answer_button.dart";
import "package:advance_basics/date/questions.dart";
import 'package:google_fonts/google_fonts.dart';

// import 'package:advance_basics/start_app.dart';

// // MY works for practise
// class Questions extends StatefulWidget {
//   const Questions({super.key});
//   @override
//   State<Questions> createState() {
//     return _Questions(
//       text: "What are main building block of flutter UIs?",
//       option1: "Functions",
//       option2: "Components",
//       option3: "Block",
//       option4: "Widgets",
//     );
//   }
// }

// class _Questions extends State<Questions> {
//   final Color backGroundColor = const Color.fromARGB(255, 28, 19, 69);
//   final double btnWidth = 300.0;
//   _Questions({
//     required this.text,
//     required this.option1,
//     required this.option2,
//     required this.option3,
//     required this.option4,
//   });

//   final String text;
//   final String option1;
//   final String option2;
//   final String option3;
//   final String option4;

//   @override
//   Widget build(context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // padding: EdgeInsets.only(left: 30),
//           SizedBox(
//             width: 350.0,
//             child: Text(
//               // "What are the main building blocks of Flutter UIs?",
//               text,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 26,
//               ),
//             ),
//           ),

//           const SizedBox(
//             height: 40,
//           ),
//           SizedBox(
//             width: btnWidth,
//             child: FilledButton(
//               onPressed: () {},
//               style: FilledButton.styleFrom(
//                 backgroundColor: backGroundColor,
//                 // padding: paddingBtn,
//               ),
//               child: Text(option1),
//             ),
//           ),
//           SizedBox(
//             width: btnWidth,
//             child: FilledButton(
//               onPressed: () {},
//               style: FilledButton.styleFrom(
//                 backgroundColor: backGroundColor,
//                 // padding: paddingBtn,
//               ),
//               child: Text(option2),
//             ),
//           ),
//           SizedBox(
//             width: btnWidth,
//             child: FilledButton(
//               onPressed: () {},
//               style: FilledButton.styleFrom(
//                 backgroundColor: backGroundColor,
//                 // padding: paddingBtn,
//               ),
//               child: Text(option3),
//             ),
//           ),
//           SizedBox(
//             width: btnWidth,
//             child: FilledButton(
//               onPressed: () {},
//               style: FilledButton.styleFrom(
//                 backgroundColor: backGroundColor,
//                 // padding: paddingBtn,
//               ),
//               child: Text(option4),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// THis is course work

class Question extends StatefulWidget {
  const Question({super.key, required this.onSelectAnswer});

  // storing void function in a onselectAnswer variable.
  // passing argument to the function in current file.
  final void Function(String answer) onSelectAnswer;
  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  int question = 0;

  void changeQuestion(String selectedAnswer) {
    // passing argument to the above function in Question class and storing it in the answers list in another file.
    widget.onSelectAnswer(selectedAnswer);
    setState(
      () {
        // question += 1;
        //another method
        question++;
        // for duduction
        // question--;
      },
    );
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[question];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              // Using Google Fonts
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 176, 145, 192),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // using getter function here from quiz question.dae
            ...currentQuestion.getShuffleAnswer.map(
              (item) {
                // button is pressed and the string that is associated with button will be passed to the function
                return Button(
                    onTap: () {
                      changeQuestion(item);
                    },
                    text: item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
