import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/first_page.dart';

class ThirdPage extends StatelessWidget {
  final int score;

  const ThirdPage({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Container(
        color: const Color(0xFFFFF6EE),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your score: $score',
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Replay: go back to first page with fresh timer
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const FirstPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('REPLAY', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
