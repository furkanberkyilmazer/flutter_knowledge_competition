import 'package:flutter/material.dart';
import 'question.dart';

class QuizData{
  int _indeks=0;
  int _rightCount=0;
  int _wrongCount=0;
  List<Question> _questions = [
    Question(
        questionText: ('Titanic gelmiş geçmiş en büyük gemidir.'),
        questionReply: false),
    Question(
        questionText: ('Dünyadaki tavuk sayısı insan sayısından fazladır.'),
        questionReply: true),
    Question(
        questionText: ('Kelebeklerin ömürleri bir gündür.'),
        questionReply: false),
    Question(questionText: ('Dünya düzdür.'), questionReply: false),
    Question(
        questionText: ('Kaju fıstığı aslında bir meyvenin sapıdır.'),
        questionReply: true),
    Question(
        questionText: ('Fatih Sultan Mehmet hiç patates yememiştir.'),
        questionReply: true),
  ];
  String getQuestionText(){
    return _questions[_indeks].questionText;
  }
  bool getQuestionReply(){
    return _questions[_indeks].questionReply;
  }
  void nextQuestion()
  {
    if(_indeks < _questions.length-1)
    _indeks++;
  }
  void rightReply(){
    _rightCount++;
  }
  void wrongReply(){
    _wrongCount++;
  }

  String getRightAndWrongCount()
  {

      return  'Doğru Sayısı: $_rightCount , Yanlış Sayısı: $_wrongCount ';

  }
  bool isTheTestOver()
  {
    if(_indeks +1 >= _questions.length)
      return true;
    else
      return false;
  }

  void resetQuiz()
  {

    _indeks=0;
    _wrongCount=0;
    _rightCount=0;

  }

}
