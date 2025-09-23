import 'package:flutter/material.dart';

class PracticeButton extends StatelessWidget {
  const PracticeButton({super.key});

  Widget createOutlineButton() {
    return OverflowBar(
      alignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            backgroundColor: Colors.amber,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            side: const BorderSide(color: Colors.black, width: 2),
          ),
          child: const Text('OutlinedButton'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purple,
                    elevation: 6,
                    shadowColor: Colors.red,
                  ),
                  child: const Text('Elevated'),
                ),
              ),
            ),

            FilledButton(onPressed: () {}, child: Text('Filled Button')),
            const Divider(),
            createOutlineButton(),
          ],
        ),
      ),
    );
  }
}
