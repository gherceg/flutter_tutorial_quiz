import 'package:flutter/material.dart';

import 'score_page.dart';

import 'package:quiz/ui/answer_button.dart';
import 'package:quiz/ui/question_text.dart';
import 'package:quiz/ui/correct_wrong_overlay.dart';

import 'package:quiz/utils/question.dart';
import 'package:quiz/utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Flutter rocks", true),
    new Question("This statement is true", true),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;


  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.questionText;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    // check if answer is correct
    isCorrect = (answer == currentQuestion.answer);
    // pass to quiz to score
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true,() => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if(questionNumber == quiz.length) {
              // launch the score page
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.questionText;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container(),
      ],
    );
  }
}
