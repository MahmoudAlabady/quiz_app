import 'package:flutter/material.dart';
import 'main.dart';
class Result extends StatelessWidget {

  final Function resetQuiz;
  final int resultScore;

  Result(this.resetQuiz, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = "You are good !";
    }
    else if (resultScore >= 40) {
      resultText = "You are bad !";
    }

    else
    {
      resultText = "You are ill !";
    }


    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "your Score is $resultScore",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: value_black),
            textAlign: TextAlign.center,

          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold,color: value_black),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart The App",
                style: TextStyle(color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
