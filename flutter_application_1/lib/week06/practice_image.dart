import 'package:flutter/material.dart';

class PracticeImage extends StatelessWidget {
  const PracticeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          // width: 200,
          // height: 400,
          'https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
