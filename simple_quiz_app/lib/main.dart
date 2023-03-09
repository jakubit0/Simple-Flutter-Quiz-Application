import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who wrote "W pustyni i w puszczy?',
      'answers': [
        {'text': 'J.K Rowling', 'score': 1},
        {'text': 'Juliusz Słowacki', 'score': 1},
        {'text': 'Henryk Sienkiewicz', 'score': 10},
        {'text': 'Donald Trump', 'score': 1},
      ],
    },
    {
      'questionText': 'Which city is the capital of Belgium?',
      'answers': [
        {'text': 'Warsaw', 'score': 1},
        {'text': 'Paris', 'score': 1},
        {'text': 'Bruseels', 'score': 10},
        {'text': 'Porto', 'score': 1},
      ],
    },
    {
      'questionText': 'When was the wheel invented?',
      'answers': [
        {'text': '3500 r.p.n.e', 'score': 10},
        {'text': '1800 r', 'score': 1},
        {'text': '2000 r', 'score': 1},
        {'text': '1914 r', 'score': 1},
      ],
    },
  ];

  var _qIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
       _qIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _qIndex = _qIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Quiz'),
          backgroundColor: Colors.amber[200],
        ),
        body: _qIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                qIndex: _qIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
