import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import "package:audioplayers/audioplayers.dart";

// final audioPlayer = AudioPlayer();

class StartScreen extends StatelessWidget {
  // definantion pointer function type and passing it to constructor and also giving return type of function
  // const StartScreen({super.key, required void Function() this.startQuiz});
  // another method of above problem
  const StartScreen(this.startQuiz, {super.key});

  // Pointer function.
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 280,
              color: const Color.fromARGB(150, 252, 251, 251),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Text(
              "Learn Flutter the fun way!",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 176, 145, 192),
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 236, 218, 247)),
              // style: const ButtonStyle(enableFeedback: false, ),
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start Quiz",
              ),
            ),
          )
        ],
      ),
    );
  }
}
