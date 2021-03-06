import 'package:flutter/material.dart';
import 'main.dart';
class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: value_black),
          textAlign: TextAlign.center,
        ),);
  }
}
