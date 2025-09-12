import 'package:flutter/material.dart';

class Assign1 extends StatelessWidget {
  const Assign1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],

      body: Column(
        children: [
          const Text(
            'Wedding Organizer',
            style: TextStyle(color: Colors.white, fontFamily: "Sevillana"),
          ),
        ],
      ),
    );
  }
}
