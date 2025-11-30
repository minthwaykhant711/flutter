import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/third_page.dart';

class SecondPage extends StatefulWidget {
  final int initialScore; // from first page
  final int totalTime; // remaining seconds

  const SecondPage({Key? key, this.initialScore = 0, this.totalTime = 10})
    : super(key: key);

  /// Helper used when time is up on the previous page to jump directly to summary
  static Widget summaryFromTimeout({
    required int score,
    required int totalTime,
  }) {
    return ThirdPage(score: score);
  }

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late int remaining;
  Timer? timer;
  bool answered = false;

  @override
  void initState() {
    super.initState();
    remaining = widget.totalTime;
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        remaining -= 1;
        if (remaining <= 0) {
          timer?.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => ThirdPage(score: widget.initialScore),
            ),
          );
        }
      });
    });
  }

  void selectAnswer(bool isCorrect) {
    if (answered) return;
    answered = true;
    timer?.cancel();
    final finalScore = widget.initialScore + (isCorrect ? 1 : 0);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => ThirdPage(score: finalScore)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question 2')),
      body: Container(
        color: const Color(0xFFEFFAF6),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Time left: $remaining s',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text(
                  'What is the capital of France?',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => selectAnswer(false),
                  child: const Text('Berlin'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => selectAnswer(true),
                  child: const Text('Paris'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => selectAnswer(false),
                  child: const Text('Madrid'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
