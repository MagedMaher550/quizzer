import 'package:flutter/cupertino.dart';

class QuizQuestion {
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String correctAnswer;

  QuizQuestion({
    @required this.question,
    @required this.answer1,
    @required this.answer2,
    @required this.answer3,
    @required this.answer4,
    @required this.correctAnswer
});


}