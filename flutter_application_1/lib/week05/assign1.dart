import 'package:flutter/material.dart';

class Assign1 extends StatelessWidget {
  const Assign1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Wedding Organizer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Sevillana",
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  const Text(
                    'Pre-wedding. Photo, Party',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: "Sevillana",
                    ),
                  ),

                  SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Our Services',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                '345 Moo 1 Thasud Chiang Rai, Thailand',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
