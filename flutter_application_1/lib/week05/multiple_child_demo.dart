import 'package:flutter/material.dart';

class MultipleChildDemo extends StatelessWidget {
  const MultipleChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // children: [
          //   Container(width: 100, height: 100, color: Colors.green),
          //   Container(width: 100, height: 200, color: Colors.yellow),
          //   Container(width: 100, height: 100, color: Colors.red),
          // ],
          // children: [
          //   Container(width: 100, height: 100, color: Colors.green),
          //   Spacer(flex: 1),
          //   Container(width: 100, height: 200, color: Colors.yellow),
          //   Spacer(flex: 2),
          //   Container(width: 100, height: 100, color: Colors.red),
          // ],
          children: [
            Expanded(
              flex: 1,
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
            Container(width: 100, height: 200, color: Colors.yellow),
            Expanded(
              flex: 1,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
