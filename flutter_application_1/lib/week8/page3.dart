import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/page1.dart';

class Page3 extends StatelessWidget {
  Page3({super.key});
  TextEditingController tc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: tc,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your name',
              ),
            ),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                //pass the data from the text field to page 2
                Navigator.pop(context, tc.text);
              },
              child: Text('OK'),
            ),

            FilledButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Page1()),
                  (route) => false,
                );
              },
              style: FilledButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
