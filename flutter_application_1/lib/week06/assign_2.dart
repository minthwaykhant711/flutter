import 'dart:async';

import 'package:flutter/material.dart';

class Assign2 extends StatefulWidget {
  const Assign2({super.key});

  @override
  State<Assign2> createState() => _Assign2State();
}

class _Assign2State extends State<Assign2> {
  int count = 0;
  double timeleft = 1.00;
  Timer? timer;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  void startGame() {
    timer?.cancel();
    setState(() {
      count = 0;
      timeleft = 1.00;
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(milliseconds: 10), (t) {
      setState(() {
        timeleft -= 0.01;
        if (timeleft <= 0) {
          timeleft = 0;
          isRunning = false;
          timer?.cancel();
        }
      });
    });
  }

  void addClick() {
    if (isRunning) {
      setState(() {
        count++;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(timeleft.toStringAsFixed(2)),
                SizedBox(height: 8),
                Text(
                  'Click =  $count',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: addClick,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      label: Text(
                        'Click',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.touch_app),
                    ),

                    OutlinedButton.icon(
                      onPressed: startGame,
                      label: Text('Play', style: TextStyle(color: Colors.red)),
                      icon: Icon(Icons.refresh, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
