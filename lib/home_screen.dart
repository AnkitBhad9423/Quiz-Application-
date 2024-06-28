import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen( this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build( context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz_logo.png",
            width: 280,
            color: const Color.fromARGB(208, 227, 227, 227),
          ),
          const SizedBox(height: 80,),
           Text(
              "Learn Flutter the Fun way!!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 194, 192, 255),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 60,),
          OutlinedButton.icon(
            onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                  "Start Quiz"),
          )
        ],
      ),
    );
  }
}
