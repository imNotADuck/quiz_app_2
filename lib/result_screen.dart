import 'package:flutter/material.dart';
import 'package:flutter2_quiz_app/result_answer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.resetQuizCallback,
    required this.answers,
  });

  final void Function() resetQuizCallback;
  final List<String> answers;

  List<Map<String, Object>> getResultAnswers() {
    final List<Map<String, Object>> result = [];
    for (var i = 0; i < questions.length; i++) {
      result.add({
        'index': i+1,
        'question': questions[i].text,
        'answer': answers[i],
        'expectedAnswer': questions[i].answers.first,
        'isCorrectAnswer': answers[i] == questions[i].answers.first,
      });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final count = getResultAnswers().where((item) => item['isCorrectAnswer'] == true).length;
    final currentQuestion = getResultAnswers()[1];
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('$count out of ${answers.length} accepted!', style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 30,
        ),
        ResultAnswer(resultItemList: getResultAnswers(),),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: resetQuizCallback,
          icon: const Icon(Icons.restart_alt_rounded, size: 24),
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red),
          label: const Text('Try again'),
        ),
      ]),
    );
  }
}
