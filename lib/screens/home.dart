import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classes/anime_quiz.dart';
import '../classes/drawer.dart';



String selectedAnime = "naruto";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar (
        title: Text ("Anime Quizzer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            AnimeQuiz(
              imageText: "Naruto Quiz",
              imagePath: "home_images/naruto.png",
              onClick: (){
                selectedAnime = "Naruto";
                Navigator.pushNamed(context, "/questions", arguments: {
                  "anime": selectedAnime
                });
              },
            ),
            AnimeQuiz(
              imageText: "Bleach Quiz",
              imagePath: "home_images/bleach.jpg",
              onClick: (){
                selectedAnime = "Bleach";
                Navigator.pushNamed(context, "/questions", arguments: {
                  "anime": selectedAnime
                });
              },
            ),
            AnimeQuiz(
              imageText: "AOT Quiz",
              imagePath: "home_images/aot.jpg",
              onClick: (){
                selectedAnime = "AOT";
                Navigator.pushNamed(context, "/questions", arguments: {
                  "anime": selectedAnime
                });
              },
            ),
            AnimeQuiz(
              imageText: "One Piece Quiz",
              imagePath: "home_images/one_piece.jpg",
              onClick: (){
                selectedAnime = "One Piece";
                Navigator.pushNamed(context, "/questions", arguments: {
                  "anime": selectedAnime
                });
              },
            ),
            AnimeQuiz(
              imageText: "HXH Quiz",
              imagePath: "home_images/hxh.jpg",
              onClick: (){
                selectedAnime = "HXH";
                Navigator.pushNamed(context, "/questions", arguments: {
                  "anime": selectedAnime
                });
              },
            ),
            AnimeQuiz(
              imageText: "Dragon Ball Quiz",
              imagePath: "home_images/dragon_ball.jpg",
              onClick: (){
                selectedAnime = "Dragon Ball";
                Navigator.pushNamed(context, "/questions", arguments: {
                  "anime": selectedAnime
                });
              },
            ),
            AnimeQuiz(
              imageText: "Mixed Quiz",
              imagePath: "home_images/mix.jpg",
              onClick: (){
                selectedAnime = "Mixed";
                Navigator.pushNamed(context, "/questions", arguments: {
                  "anime": selectedAnime
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
