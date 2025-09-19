import 'package:flutter/material.dart';

class ImagesDemo extends StatelessWidget {
  const ImagesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/images/sky.jpg', fit: BoxFit.fill),
      ),
    );
  }
}
