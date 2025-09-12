import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ryan first app',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: Center(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                const Text('Hello, World'),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    print('Click');
                  },

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  child: const Text(
                    'Click',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
