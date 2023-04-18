import 'package:flutter/material.dart';
import 'package:flutter2_quiz_app/data/questions.dart';
import 'package:flutter2_quiz_app/quiz_screen.dart';
import 'package:flutter2_quiz_app/result_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? _activeScreen;
  List<String> _selectedAnswers = [];

  void switchScreen() {
    setState(() {
      _activeScreen = QuizScreen(
        saveAnswerCallback: saveAnswer,
      );
    });
  }

  void resetQuiz() {
    _selectedAnswers = [];
    setState(() {
      _activeScreen = StartScreen(switchScreen);
    });
  }

  void saveAnswer(String answer) {
    _selectedAnswers.add(answer);
    print('answer added: $answer');
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = ResultScreen(
          answers: _selectedAnswers,
          resetQuizCallback: resetQuiz,
        );
      });
    }
  }

  @override
  void initState() {
    _activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 231, 94, 84),
                Color.fromARGB(255, 175, 18, 18),
                Color.fromARGB(255, 190, 45, 45),
                Color.fromARGB(255, 90, 3, 3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _activeScreen,
        ),
      ),
    );
  }
}
