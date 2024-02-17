import 'package:flutter/material.dart';

class ImpliAnimation extends StatefulWidget {
  const ImpliAnimation({super.key});
  @override
  State<ImpliAnimation> createState() {
    return _ImpliAnimationState();
  }
}

class _ImpliAnimationState extends State<ImpliAnimation> {
  bool applyRotation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Screen"),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                applyRotation = !applyRotation;
                print("this is apply rotation: $applyRotation");
              });
            },
            icon: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 300,
              ),
              transitionBuilder: ((child, animation) => RotationTransition(
                    turns: Tween<double>(begin: 0.7, end: 1).animate(animation),
                    child: child,
                  )),
              child: Icon(
                applyRotation ? Icons.star : Icons.star_border,
                // color: Colors.green,
                key: ValueKey(applyRotation),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
