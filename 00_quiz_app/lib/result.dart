import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;

  Result({this.totalScore, this.reset});
  String get resultPhase {
    var resultText = 'You\'ve done!';
    if (totalScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (totalScore <= 16) {
      resultText = 'You are strange!';
    } else {
      resultText = 'You are so lit!';
    }
    resultText += '\nScore: ${totalScore}';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: reset,
            child: Text(
              'Restart the quiz',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
