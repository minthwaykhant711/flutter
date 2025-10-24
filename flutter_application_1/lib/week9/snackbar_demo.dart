import 'package:flutter/material.dart';

class SnackbarDemo extends StatelessWidget {
  const SnackbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('You have completed your task'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      debugPrint('Undo Action!');
                    },
                  ),
                ),
              );
            },
            child: Text("Show"),
          ),
        ),
      ),
    );
  }
}
