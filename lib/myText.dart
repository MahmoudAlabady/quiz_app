import 'package:flutter/material.dart';
TextStyle s =  TextStyle(
  color: Colors.white,
  fontSize: 35,
);
TextStyle s2 =  TextStyle(
  color: Colors.black,
  fontSize: 35,
);

class MyText extends StatelessWidget{
  String _text;
  TextStyle _textStyle=s;
  MyText(this._text,this._textStyle);

  @override
  Widget build(BuildContext context) {
    return Text(_text,style: _textStyle,);
  }
}