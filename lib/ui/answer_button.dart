import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  BuildContext _context;
  // specifies whether true or false button
  final bool answer;
  // callback for when button is tapped
  final VoidCallback _onTap;

  AnswerButton(this.answer,this._onTap);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Expanded(
      child: new Material(
        color: answer ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 5.0),
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),
              padding: new EdgeInsets.all(10.0),
              child: new Text(answer ? "True" : "False",
                style: new TextStyle(color: Colors.white, fontSize: 50.0,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
