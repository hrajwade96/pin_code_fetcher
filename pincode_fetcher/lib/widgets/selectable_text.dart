import 'package:flutter/material.dart';

class Selectable extends StatelessWidget {
  final String text;

  const Selectable(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
        TextSpan(style: const TextStyle(fontSize: 18), children: [
      TextSpan(text: text),
    ]));
  }
}
