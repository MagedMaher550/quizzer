import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeQuiz extends StatelessWidget {
  final String imageText;
  final String imagePath;
  final Function onClick;

  AnimeQuiz({
    @required this.imageText,
    @required this.imagePath,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      height: 200,
      child: FlatButton(
        child: Container(
          child: Center(
              child: Text (
                imageText,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white60
                ),
              )
          ),
        ),
        onPressed: (){onClick();},
      ),
    );
  }
}
