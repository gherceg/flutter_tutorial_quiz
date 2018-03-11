import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question,this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {

  AnimationController _textAnimationController;
  Animation<double> _textAnimation;


  @override
  void initState() {
    super.initState();
    _textAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    _textAnimation = new CurvedAnimation(parent: _textAnimationController, curve: Curves.bounceOut);
    _textAnimation.addListener(() => this.setState(() {}));
    _textAnimationController.forward();
  }


  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question) {
      // animate again
      _textAnimationController.reset();
      _textAnimationController.forward();
    }
  }


  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        child: new Center(
          child: new Text(
            "Question " + widget._questionNumber.toString() + ": " + widget._question,
            style: new TextStyle(fontSize: _textAnimation.value * 20.0),
          ),
        ),
      ),
    );
  }
}
