import 'package:advance_basics/date/questions.dart';
import 'package:flutter/material.dart';
import 'package:advance_basics/start_app.dart';
import 'package:advance_basics/question_screen.dart';
import 'package:advance_basics/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List<String> selectedAnswer = [];
  int correctAnswer = 0;
  int wrongAnswer = 0;

  // Widget? activeScreen;
  // Changing Screen
  //Changing the content conditionally
  // when we store class inside a variable the type of the variable will be like StartScreen() Type
  // To avoid type errors use Widget instead of var when storing the Widget class in variable
  //passing  pointer functions to the StartScreen class.

  // Widget activeScreen = const StartScreen(switchScreen); //this is called and the method switchScreen is called simultanesouly
  // so to avoid error when passing argument to above class use.
  // init method will be executed once this will be executed before the build method runs.
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super
  //       .initState(); // this method make sure that in the parent class like State init method will be executed.
  // }

  // getting rid of init state

  // lifting state the StartScreen must have access to switchScreen.

  // Method of changing is called when button is pressed
  void switchScreen() {
    setState(
      () {
        activeScreen = "questions-screen";
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    print("this is selected Answer. $selectedAnswer");
    if (selectedAnswer.length == questions.length) {
      for (var i = 0; i < selectedAnswer.length; i++) {
        if (selectedAnswer[i] == questions[i].answers[0]) {
          correctAnswer += 1;
        } else {
          wrongAnswer += 1;
        }
      }
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartScreen() {
    selectedAnswer = [];
    setState(
      () {
        activeScreen = "start-screen";
      },
    );
  }

// When we call setState the below build method will be called again.
  @override
  Widget build(context) {
    Widget widgetScreen = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      widgetScreen = Question(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == "result-screen") {
      widgetScreen = Result(
        correctAnswer: correctAnswer,
        answerList: selectedAnswer,
        func: restartScreen,
      );
    } else if (activeScreen == "start-screen") {
      widgetScreen = StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 82, 4, 160),
                Color.fromARGB(255, 104, 14, 134)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widgetScreen,
        ),
      ),
    );
  }
}
