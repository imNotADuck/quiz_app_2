import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color:const Color.fromARGB(160, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Hoomen qiz',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 188, 188),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            label: const Text('Start Qiz'),
          ),
        ],
      ),
    );
  }
}
