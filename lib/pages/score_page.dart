import 'package:flutter/material.dart';

import 'landing_page.dart';

class ScorePage extends StatelessWidget {

  final int correctAnswers;
  final int totalQuestions;

  ScorePage(this.correctAnswers, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("You Scored:",style: new TextStyle(color: Colors.white, fontSize: 30.0),),
          new Text(correctAnswers.toString() + "/" + totalQuestions.toString(),style: new TextStyle(color: Colors.white, fontSize: 30.0),),
          new Padding(padding: const EdgeInsets.only(bottom: 20.0)),
          new RaisedButton(
            color: Colors.white,
            child: new Text(
              "Play Again",
              style: new TextStyle(color: Colors.blueAccent, fontSize: 30.0)),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null),
          ),
        ],
      ),
    );
  }
}