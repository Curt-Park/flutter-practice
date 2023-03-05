import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}
// void main => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ],
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Jogn', 'score': 10},
        {'text': 'Curt', 'score': 5},
        {'text': 'Maria', 'score': 3},
        {'text': 'Matt', 'score': 1},
      ],
    },
  ];
  var _questionIdx = 0;
  var _totalScore = 0;

  void _resetQuize() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(score) {
    _totalScore += score;
    setState(() {
      _questionIdx += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIdx < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIdx: _questionIdx,
              )
            : Result(
                totalScore: _totalScore,
                reset: _resetQuize,
              ),
      ),
    );
  }
}
