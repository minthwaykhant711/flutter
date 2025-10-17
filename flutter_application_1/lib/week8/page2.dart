import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  String name = '';
  int price = 0;
  List date = [];
  Page2({
    super.key,
    required this.name,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    //get the data from page 1
    // Map<String, dynamic> data =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Column(
        children: [
          Text('Name : $name'),
          Text('Price : $price'),
          Text('Origin date: $date[0]'),
          Text('Expiration date: $date[1]'),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
    ;
  }
}
