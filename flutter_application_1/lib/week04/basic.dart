import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  const Basic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 0, 0, 255),
      ),

      body: Center(
        child: Text(
          'Hello Me',
          style: TextStyle(fontSize: 22, color: Colors.blue[700]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.blue,
        // child: Text('Click'),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
