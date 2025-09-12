import 'package:flutter/material.dart';

class Assign2 extends StatefulWidget {
  const Assign2({super.key});

  @override
  State<Assign2> createState() => _Assign2State();
}

class _Assign2State extends State<Assign2> {
  String result = '';
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();

  void sumNumbers() {
    String text1 = tcNum1.text;
    String text2 = tcNum2.text;

    if (text1.isEmpty || text2.isEmpty) {
      setState(() {
        result = 'Please fill both numbers';
      });
      return;
    }

    int? num1 = int.tryParse(text1);
    int? num2 = int.tryParse(text2);

    if (num1 == null || num2 == null) {
      setState(() {
        result = 'Please input only numbers';
      });
      return;
    }

    setState(() {
      result = 'Result = ${num1 + num2}';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tcNum1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'First Number'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text('+', style: TextStyle(fontSize: 24)),
                  ),

                  Expanded(
                    child: TextField(
                      controller: tcNum2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Second Number'),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: sumNumbers,
                    style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text('Calculate'),
                  ),
                  SizedBox(width: 8),
                  FilledButton(
                    onPressed: clear,
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Clear'),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Text(result, style: TextStyle(fontSize: 20, color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
