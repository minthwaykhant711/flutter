import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //state variables
  // String message = 'Hello Friends';
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 0, 0, 255),
      ),

      body: Center(
        child: Text(
          'Counter = $count',
          style: TextStyle(fontSize: 22, color: Colors.blue[700]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // debugPrint('test');
          setState(() {
            count++;
          });
        },
        backgroundColor: Colors.blue,
        // child: Text('Click'),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
