import 'package:flutter/material.dart';

class PracticeWeek5 extends StatelessWidget {
  const PracticeWeek5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(width: 100, color: Colors.red),
          Expanded(
            child: Container(
              width: 200,
              color: Colors.greenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 100, height: 100, color: Colors.orange),
                  Container(width: 100, height: 100, color: Colors.blue),
                ],
              ),
            ),
          ),
          Container(width: 100, color: Colors.blue),
        ],
      ),
    );
  }
}
