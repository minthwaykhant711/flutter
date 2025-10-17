import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/fruit.dart';
import 'package:flutter_application_1/week8/page1.dart';
import 'package:flutter_application_1/week8/page3.dart';

class Page2 extends StatefulWidget {
  //tech 3
  Fruit fruit;

  //tech 2
  // String name = '';
  // int price = 0;
  // List date = [];

  // Page2({
  //   super.key,
  //   required this.name,
  //   required this.price,
  //   required this.date,
  // });

  Page2({super.key, required this.fruit});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String? username = '';
  @override
  Widget build(BuildContext context) {
    //tech 1
    //get the data from page 1
    // Map<String, dynamic> data =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: Column(
          children: [
            //tech 2
            // Text('Name : $name'),
            // Text('Price : $price'),
            // Text('Origin date: ${date[0]}'),
            // Text('Expiration date: ${date[1]}'),

            //tech 3
            Text('Name : ${widget.fruit.name}'),
            Text('Price : ${widget.fruit.price}'),
            Text('Origin date: ${widget.fruit.date[0]}'),
            Text('Expiration date: ${widget.fruit.date[1]}'),
            Text('Country : ${widget.fruit.country}'),
            Text('Username : $username'),

            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),

            FilledButton(
              onPressed: () async {
                String result = await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Page3()),
                );

                setState(() {
                  username = result;
                });
              },
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Next'),
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
    ;
  }
}
