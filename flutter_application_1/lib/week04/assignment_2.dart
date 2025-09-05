import 'package:flutter/material.dart';
import 'dart:math';

class Assign2 extends StatefulWidget {
  const Assign2({super.key});

  @override
  State<Assign2> createState() => _Assign2State();
}

class _Assign2State extends State<Assign2> {
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();
  String result = '';

  void sum() {
    final n1 = double.tryParse(tcNum1.text);
    final n2 = double.tryParse(tcNum2.text);
    setState(() {
      if (tcNum1.text.isEmpty || tcNum2.text.isEmpty) {
        result = 'Please input both numbers';
      } else if (n1 == null || n2 == null) {
        result = 'Please input only numbers';
      } else {
        result = 'Sum: ${n1 + n2}';
      }
    });
  }

  void power() {
    final n1 = double.tryParse(tcNum1.text);
    final n2 = double.tryParse(tcNum2.text);
    setState(() {
      if (tcNum1.text.isEmpty || tcNum2.text.isEmpty) {
        result = 'Please input both numbers';
      } else if (n1 == null || n2 == null) {
        result = 'Please input only numbers';
      } else {
        result = 'Power: ${pow(n1, n2)}';
      }
    });
  }

  void clear() {
    setState(() {
      tcNum1.clear();
      tcNum2.clear();
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: tcNum1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: tcNum2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: sum,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text('Sum', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: power,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 134, 241),
                  ),
                  child: Text('Power', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: clear,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Clear', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(result, style: TextStyle(fontSize: 18, color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
