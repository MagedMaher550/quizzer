import 'package:animequizzer/data/dragon_ball.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/hunter.dart';
import '../classes/quiz_class.dart';
import '../classes/answer_button.dart';
import '../classes/drawer.dart';
import 'dart:math';
import '../data/naruto.dart';
import '../data/one_piece.dart';
import '../data/aot.dart';
import '../data/bleach.dart';
import 'package:admob_flutter/admob_flutter.dart';


class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  int index = 0;
  int score = 0;
  double finalScore = 0;
  int numberOfQuestions = 15;
  List<QuizQuestion> selectedQuestions = hunterQuestions;
  String selectedAnime;
  bool checkDoubleQuestions = true;
  bool checkShuffle = true;
  AdmobInterstitial _admobInterstitial;

  @override
  void initState() {
    // TODO: implement initState
    _admobInterstitial = createInterstitial();
    super.initState();
  }

  AdmobInterstitial createInterstitial(){
    return AdmobInterstitial(
      adUnitId: "ca-app-pub-3173563832146472/3382021905",
      listener: (AdmobAdEvent event, Map<String, dynamic> args){
        if(event == AdmobAdEvent.loaded)
          _admobInterstitial.show();
        else if(event == AdmobAdEvent.closed)
          _admobInterstitial.dispose();
      }
    );
  }

  void shuffle(List<QuizQuestion> questions) {
    var random = new Random();

    for (var i = questions.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = questions[i];
      questions[i] = questions[n];
      questions[n] = temp;
    }
  }

  void changeIndex() {
    setState(() {
      if(index < numberOfQuestions-1)
        index += 1;
      else {
        Navigator.pushReplacementNamed (context, "/result", arguments: {
          "result": score,
          "anime": selectedAnime,
          "numberOfQuestions": numberOfQuestions
          }
        );
        _admobInterstitial.load();
      }
    });
  }


  void checkAnswer(String givenAnswer, String correctAnswer) {
    if(givenAnswer == correctAnswer) {
      score += 1;
    }
  }


  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;
    selectedAnime = data["anime"];

    if(selectedAnime == "HXH" && checkShuffle)
      selectedQuestions = hunterQuestions;
    else if(selectedAnime == "One Piece" && checkShuffle)
      selectedQuestions = onePieceQuestions;
    else if(selectedAnime == "AOT" && checkShuffle)
      selectedQuestions = aotQuestions;
    else if(selectedAnime == "Dragon Ball" && checkShuffle)
      selectedQuestions = dragonBallQuestions;
    else if(selectedAnime == "Naruto" && checkShuffle)
      selectedQuestions = narutoQuestions;
    else if(selectedAnime == "Bleach" && checkShuffle)
      selectedQuestions = bleachQuestions;
    else if(selectedAnime == "Mixed" && checkShuffle){
      selectedQuestions = [...onePieceQuestions,...hunterQuestions,...dragonBallQuestions,...narutoQuestions,...aotQuestions,...bleachQuestions];
      if(checkDoubleQuestions){
        numberOfQuestions *= 2;
        checkDoubleQuestions=false;
      }
    }

    if(checkShuffle) {
      shuffle(selectedQuestions);
      checkShuffle = false;
    }

    return Scaffold (
      drawer: MyDrawer(),
      appBar: AppBar (
        title: Center (child: Text ("$selectedAnime Quiz")),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text (
                "${index+1}. ${selectedQuestions[index].question}",
                style: TextStyle (
                    fontSize: 25,
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
            AnswerButton (
              answer: selectedQuestions[index].answer1,
              onClick: () {
                checkAnswer(selectedQuestions[index].answer1, selectedQuestions[index].correctAnswer);
                changeIndex();
              },
            ),
            AnswerButton (
                answer: selectedQuestions[index].answer2,
                onClick: (){
                  checkAnswer(selectedQuestions[index].answer2, selectedQuestions[index].correctAnswer);
                  changeIndex();
                }
            ),
            AnswerButton (
              answer: selectedQuestions[index].answer3,
              onClick: () {
                checkAnswer(selectedQuestions[index].answer3, selectedQuestions[index].correctAnswer);
                changeIndex();
              },
            ),
            AnswerButton (
              answer: selectedQuestions[index].answer4,
              onClick: () {
                checkAnswer(selectedQuestions[index].answer4, selectedQuestions[index].correctAnswer);
                changeIndex();
              },
            ),
            SizedBox(height: 35,),
            AdmobBanner(
              adUnitId: "ca-app-pub-3173563832146472/5133253125",
              adSize: AdmobBannerSize.LARGE_BANNER,
            ),
          ],
        ),
      ),
    );
  }
}

