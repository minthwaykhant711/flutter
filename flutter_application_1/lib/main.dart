import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App', style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 0, 0, 255),
        ),

        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 22, color: Colors.blue[700]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.blue,
          // child: Text('Click'),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    ),
  );
}
