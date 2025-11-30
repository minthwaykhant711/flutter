import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/second_page.dart';

class FirstPage extends StatefulWidget {
  final int totalTime; // seconds
  final void Function()? onTimeUpExternally;

  const FirstPage({Key? key, this.totalTime = 10, this.onTimeUpExternally})
    : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late int remaining;
  Timer? timer;
  bool answered = false;
  bool correct = false;

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
          // time up -> go to summary directly, passing score so far
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => SecondPage.summaryFromTimeout(
                score: correct ? 1 : 0,
                totalTime: widget.totalTime,
              ),
            ),
          );
          widget.onTimeUpExternally?.call();
        }
      });
    });
  }

  void selectAnswer(bool isCorrect) {
    if (answered) return;
    answered = true;
    correct = isCorrect;
    timer?.cancel();
    // If answered correctly or incorrectly, proceed to second question, carrying score
    final score = isCorrect ? 1 : 0;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => SecondPage(initialScore: score, totalTime: remaining),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question 1')),
      body: Container(
        color: const Color(0xFFF6F0FF),
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
                const Text('What is 2 + 2?', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => selectAnswer(false),
                  child: const Text('3'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => selectAnswer(true),
                  child: const Text('4'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => selectAnswer(false),
                  child: const Text('5'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
