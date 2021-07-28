import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer ({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("drawer_images/header.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Center (
                    child: Text(
                      "Anime Quizzer",
                      style: TextStyle (
                        fontSize: 25,
                        color: Colors.white70
                      ),
                    ),
                  )
                ),
              ),
              ListTile (
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("drawer_images/home.png"),
              ),
                title: Text("Home Page", style: TextStyle(fontSize: 21),),

                onTap: () {
                  Navigator.pushNamed(context, "/");
                },

              ),
              SizedBox(height: 15),
              DrawerLine(
                imagePath: "drawer_images/naruto.jpg",
                lineText: "Naruto Quiz",
                animeName: "Naruto",
              ),
              DrawerLine(
                imagePath: "drawer_images/bleach.jpg",
                lineText: "Bleach Quiz",
                animeName: "Bleach",
              ),
              DrawerLine(
                imagePath: "drawer_images/aot.jpg",
                lineText: "AOT Quiz",
                animeName: "AOT",
              ),
              DrawerLine(
                imagePath: "drawer_images/one_piece.jpg",
                lineText: "One Piece Quiz",
                animeName: "One Piece",
              ),
              DrawerLine(
                imagePath: "drawer_images/hxh.jpg",
                lineText: "HXH Quiz",
                animeName: "HXH",
              ),
              DrawerLine(
                imagePath: "drawer_images/dragon_ball.jpg",
                lineText: "Dragon Ball Quiz",
                animeName: "Dragon Ball",
              ),
              DrawerLine(
                imagePath: "home_images/mix.jpg",
                lineText: "Mixed Quiz",
                animeName: "Mixed",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerLine extends StatelessWidget {
  final String imagePath;
  final String lineText;
  final String animeName;

  DrawerLine({
    @required this.imagePath,
    @required this.lineText,
    @required this.animeName
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile (
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imagePath),
          ),
          title: Text(lineText, style: TextStyle(fontSize: 21),),
          onTap: () {
            Navigator.pushNamed(context, "/questions", arguments: {
              "anime": animeName
            });
          },

        ),
        SizedBox(height: 15),
      ],
    );
  }
}
