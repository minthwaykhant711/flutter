import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/first_page.dart';

void main() {
  runApp(const Assign2App());
}

class Assign2App extends StatelessWidget {
  const Assign2App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timed Quiz Assignment',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const FirstPage(totalTime: 10),
    );
  }
}
