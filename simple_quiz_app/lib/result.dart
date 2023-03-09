import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore == 30) {
      resultText = 'You awesome';
    } else if (resultScore == 20) {
      resultText = 'Pretty likeable';
    } else if (resultScore == 10) {
      resultText = 'You are strange';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber[200]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),            
            child: const Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}