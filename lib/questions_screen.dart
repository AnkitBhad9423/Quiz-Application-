import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onselectAnswer,});

  final void Function(String answer) onselectAnswer;


  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex=0;
  void answerQuestion(String selectedAnswer) {
    widget.onselectAnswer( selectedAnswer);
    setState(() {
      currentQuestionIndex++ ;
    });

  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 237, 166, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestions.getShuffledAnswers().map((itemAns ) {
              return AnswerButton(
                answerText: itemAns ,
                onTap: () {
                 answerQuestion(itemAns);
              },
              );
             }
            ),
          ],
        ),
      ),
    );
  }
}
