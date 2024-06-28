import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
//import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

import 'home_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> _selectedAnswers = [ ] ;
  var _activeScreen ='start-Screen';

  void _switchScreen(){
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }
  void _chooseAnswer(String answer){
    _selectedAnswers.add(answer);
   if(_selectedAnswers.length == questions.length){
     setState(() {
       _activeScreen ='results-screen';

     });
   }
  }

  void restartQuiz(){
    setState(() {

      _activeScreen = 'start-Screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget= HomeScreen(_switchScreen);

    if(_activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(
        onselectAnswer: _chooseAnswer,
      );
    }

    if(_activeScreen == 'results-screen'){
      screenWidget= ResultsScreen(
        chosenAnswers: _selectedAnswers,
      onRestart: restartQuiz,
      );
    }
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(220, 76, 1, 126),
                Color.fromARGB(255, 49, 64, 227)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
