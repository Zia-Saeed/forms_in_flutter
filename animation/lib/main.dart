import 'package:animation/animation_demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimateDemo());
}

class AnimateDemo extends StatelessWidget {
  const AnimateDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: AnimationDemo(),
      ),
    );
  }
}
