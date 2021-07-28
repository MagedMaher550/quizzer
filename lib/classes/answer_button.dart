import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final String answer;
  final Function onClick;
  final Color color;

  AnswerButton({
    @required this.answer,
    @required this.onClick,
    this.color
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: FlatButton (
        child: Container (
            width: 500,
            color: color ?? Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text (
                this.answer,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
            )
        ),
        onPressed: (){this.onClick();},
      ),
    );
  }
}