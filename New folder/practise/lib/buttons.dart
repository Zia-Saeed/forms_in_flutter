import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.func});
  final String text;
  final void Function() func;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: func,
      child: Text(text),
    );
  }
}

// class _ButtonState extends State{
//   @override
//   Widget build(context){
//     widget.
//     return ElevatedButton(onPressed: (){}, child: )
//   }
// }