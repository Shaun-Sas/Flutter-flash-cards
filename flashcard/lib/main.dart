import 'package:flashcard/flashCardView.dart';
import 'package:flashcard/flashcard.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

List<Flashcard> _flashcardlist = [
  Flashcard(
      questions: "What is the programming language for flutter ?",
      answer: "Dart"),
  Flashcard(questions: "Gojo vs Sukuna ?", answer: "Sukuna"),
  Flashcard(questions: "C++ vs Java ?", answer: "Dart"),
  Flashcard(questions: "android or iphone ?", answer: "Both"),
  Flashcard(questions: "Hello what?", answer: "World")
];

var _currentIndex = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showNextCard() {
    if (_currentIndex < _flashcardlist.length - 1) {
      setState(() {
        _currentIndex = _currentIndex + 1;
      });
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  void showPrevCard() {
    if (_currentIndex - 1 >= 0) {
      setState(() {
        _currentIndex = _currentIndex - 1;
      });
    } else {
      setState(() {
        _currentIndex = _flashcardlist.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashcardView(
                        color: const Color.fromARGB(255, 134, 201, 255),
                        text: _flashcardlist[_currentIndex].questions),
                    back: FlashcardView(
                        color: Colors.green,
                        text: _flashcardlist[_currentIndex].answer))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                    style: ButtonStyle(),
                    onPressed: showPrevCard,
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.black87,
                    ),
                    label:
                        Text(style: TextStyle(color: Colors.black87), "Prev")),
                SizedBox(
                  width: 60,
                ),
                OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right, color: Colors.black87),
                    label:
                        Text(style: TextStyle(color: Colors.black87), "Prev")),
              ],
            )
          ],
        ),
      )),
    );
  }
}
