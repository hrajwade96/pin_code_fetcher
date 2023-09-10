import 'package:flutter/material.dart';

class Selectable extends StatelessWidget {
  
  final String text;

  Selectable(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
  TextSpan( 
      style: TextStyle(fontSize: 20),
      children: [
        TextSpan(text:text),
      ]
  )
);
  }
}