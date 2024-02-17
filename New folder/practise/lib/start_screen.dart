import 'package:flutter/material.dart';
import 'package:practise/btn-screen.dart';
import "package:practise/shited_screen.dart";

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<Start> createState() {
    return _StartState();
  }
}

class _StartState extends State<Start> {
  // Widget? activeScreen;

  var activeScreen = "btn-screen";
  //using ternary operator to solve the problem
  // @override
  // void initState() {
  //   activeScreen = BtnScreen(
  //     changeState: switchScreen,
  //   );
  //   super.initState();
  // }

  void switchScreen() {
    setState(
      () {
        activeScreen = "shifted-screen";
      },
    );
  }

  @override
  Widget build(context) {
    Widget screenWidget = BtnScreen(changeState: switchScreen);
    if (activeScreen != "btn-screen") {
      screenWidget = const ShiftedScreen();
    }
    // final screenWidget = activeScreen == "btn-screen"
    //     ? BtnScreen(changeState: switchScreen)
    //     : const ShiftedScreen();

    return MaterialApp(home: screenWidget);
  }
}
