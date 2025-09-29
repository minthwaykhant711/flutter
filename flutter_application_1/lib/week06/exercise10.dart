import 'dart:async';
import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  double count = 1.00; // starting value
  Timer? timer;

  void startTimer() {
    // Prevent multiple timers
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(const Duration(milliseconds: 10), (t) {
      setState(() {
        count -= 0.01;
        if (count <= 0) {
          count = 0;
          timer?.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      count = 1.00;
    });
    timer?.cancel();
    timer = null; // clear timer reference
  }

  @override
  void dispose() {
    timer?.cancel(); // cleanup when widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toStringAsFixed(2), // always show 2 decimal places
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text("Start"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: const Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
