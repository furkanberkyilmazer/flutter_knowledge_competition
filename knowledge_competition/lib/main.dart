import 'package:flutter/material.dart';

import 'constants.dart';

import 'quiz_data.dart';

import 'dart:io';


void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ),
            ),
        ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> elections = [];
  QuizData quiz_1 = QuizData();


  void buttonFonk  (bool buttonType)  {
    if(quiz_1.isTheTestOver()==true){

      showDialog(context: context, builder: (BuildContext context)  {
        return  AlertDialog(
          title:new Text("Yarışma Bitti"),
          content:new Text( quiz_1.getRightAndWrongCount()),
          actions: <Widget>[
            new TextButton(onPressed: (){
              Navigator.of(context).pop();
              setState(() {

                quiz_1.resetQuiz();
                elections = [];
              });

            },
              child: new Text("Close"),
            ),
          ],
        );
      },
      );




    }
    else{  setState(() {
      /*quiz_1.getQuestionReply() == buttonType
          ? elections.add(rightIcon)
          : elections.add(wrongIcon);*/

      if(quiz_1.getQuestionReply() == buttonType) {
        elections.add(rightIcon);
        quiz_1.rightReply();

      }
      else {
        elections.add(wrongIcon);
        quiz_1.wrongReply();
      }
      quiz_1.nextQuestion();
    });}


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz_1.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 5,
          children: elections,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.red[400],
                      ),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        buttonFonk(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.green[400],
                      ),
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        buttonFonk(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
