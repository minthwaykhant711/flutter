import 'package:flutter/material.dart';
import 'dart:async';

class TimerDemo extends StatefulWidget {
  const TimerDemo({super.key});

  @override
  State<TimerDemo> createState() => _TimerDemoState();
}

class _TimerDemoState extends State<TimerDemo> {
  // String message = 'Start';
  int count = 5;

  @override
  void initState() {
    super.initState();
    //   //create a timer
    //   Timer(Duration(seconds: 3), () {
    //     setState(() {
    //       message = 'Stop';
    //     });
    //   });
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        count--;
        if (count == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(count.toString(), style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
