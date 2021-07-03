import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color value_White = Colors.white;
Color value_black = Colors.black;
class _MyAppState extends State<MyApp> {

  bool isSwitched = false;

  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 = 0, num1 = 0, num2 = 0;

  int _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void answerQuestion(score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2) num2 = score;

    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    print(_totalScore);
    print("Answer Chosen !");
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 10},
        {'text': 'Blue', 'score': 10},
        {'text': 'Yellow', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite Friend?',
      'answers': [
        {'text': 'Omar', 'score': 10},
        {'text': 'Abady', 'score': 10},
        {'text': 'Gehad', 'score': 10},
        {'text': 'ZZZZizo', 'score': 10},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("A questionnaire",style:TextStyle(color: value_White),),
          actions: <Widget>[
            Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                    if (isSwitched == true) {
                      value_White = Colors.black;
                      value_black = Colors.white;
                    } else if (isSwitched == false) {
                      value_White = Colors.white;
                      value_black = Colors.black;
                    }
                  });
                },

              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
              activeColor: Colors.white,

                ),
          ],
        ),
        body: Container(
            color: value_White,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalScore)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back,color:value_White,size: 40),
          onPressed: () {
            if (_questionIndex == 1)
              _totalScore -= num0;
            else if (_questionIndex == 2)
              _totalScore -= num1;
            else if (_questionIndex == 3) _totalScore -= num2;

            setState(() {
              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });
          },
        ),
      ),
    );
  }
}
