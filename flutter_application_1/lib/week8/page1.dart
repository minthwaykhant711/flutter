import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Align(
        alignment: Alignment.topCenter,
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Page2(name: 'apple', price: 15, date: ['15 oct', '20 oct']),

                // settings: RouteSettings(
                //   arguments: <String, dynamic>{
                //     'name': 'apple',
                //     'price': 15,
                //     'date': ['15 October', '20 October'],
                //   },
                // ),
              ),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}
