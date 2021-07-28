import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animequizzer/classes/drawer.dart';

class ResultScreen extends StatelessWidget {

  final int numberOfQuestions = 15;

  String chooseImage(int score, int numberOfQuestions, String animeName) {
    String halfPath = "";

    if(animeName == "HXH")
      halfPath = "hxh";
    else if(animeName == "One Piece")
      halfPath = "one_piece";
    else if(animeName == "AOT")
      halfPath = "aot";
    else if(animeName == "Dragon Ball")
      halfPath = "dragon_ball";
    else if(animeName == "Naruto")
      halfPath = "naruto";
    else if(animeName == "Bleach")
      halfPath = "bleach";
    else if(animeName == "Mixed")
      halfPath = "mixed";


    if(score >= numberOfQuestions * 0.7)
      return "result_images/${halfPath}_perfect.jpg";
    else if(score > numberOfQuestions * 0.5 && score < numberOfQuestions * 0.7)
      return "result_images/${halfPath}_good.jpg";
    else
      return "result_images/${halfPath}_bad.jpg";
  }

  String feedBack(int score, String animeName, int numberOfQuestions) {

    if(animeName != "Mixed") {
      if(score >= numberOfQuestions * 0.7)
      return "Congratulations, You are a true $animeName fan";
    else if(score > numberOfQuestions * 0.5 && score < numberOfQuestions * 0.7)
      return "Not bad, but you still need to rewatch some parts of $animeName again";
    else
      return "You need to rewatch $animeName now :)";
    }
    else {
      if(score >= numberOfQuestions * 0.7)
        return "Congratulations, You are a true anime fan";
      else if(score > numberOfQuestions * 0.5 && score < numberOfQuestions * 0.7)
        return "Not bad, but you still need to rewatch some parts of these animes again";
      else
        return "You need to rewatch these animes now :)";
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    int score = data['result'];
    int numberOfQuestions = data["numberOfQuestions"];
    String animeName = data['anime'];
    String finalScore =  (score / numberOfQuestions * 100).toStringAsFixed(2);
    String imagePath = chooseImage(score, numberOfQuestions, animeName);

    
    return Scaffold (
      drawer: MyDrawer(),
        appBar: AppBar (
          title: Center(child: Text("Quiz Result")),
        ),
        body: SingleChildScrollView(
          child: Column (
            children: [
              Container (
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container (
                child: Center(
                  child: Text (
                    "Your Score Is: $finalScore%",
                    style: TextStyle (
                      fontSize: 25
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container (
                child: Center(
                  child: Text (
                    feedBack(score, animeName, numberOfQuestions),
                    style: TextStyle (
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              AdmobBanner(
                adUnitId: "ca-app-pub-3173563832146472/1180005174",
                adSize: AdmobBannerSize.LARGE_BANNER,
              ),
            ],
          ),
        )
      );
  }
}
