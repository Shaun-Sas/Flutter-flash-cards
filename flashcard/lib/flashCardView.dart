import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;
  final Color color;

  FlashcardView({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        elevation: 4,
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
        )));
  }
}
