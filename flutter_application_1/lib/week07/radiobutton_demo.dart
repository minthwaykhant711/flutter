import 'package:flutter/material.dart';

class RadiobuttonDemo extends StatefulWidget {
  const RadiobuttonDemo({super.key});

  @override
  State<RadiobuttonDemo> createState() => _RadiobuttonDemoState();
}

class _RadiobuttonDemoState extends State<RadiobuttonDemo> {
  int gValue = 1;
  List fruits = ['Apple', 'Banana', 'Orange', 'Papaya'];

  void updateRadio(int? value) {
    setState(() {
      gValue = value!;
    });
  }

  //will return the list of the widget
  List<Widget> createRadios() {
    List<Widget> widgets = [];
    for (int i = 0; i < fruits.length; i++) {
      widgets.add(Radio(value: i, groupValue: gValue, onChanged: updateRadio));
      widgets.add(Text(fruits[i]));
    }
    return widgets;
  }

  // List<Widget> createRadios() {
  //   List<Widget> widgets = List.generate(
  //     fruits.length,
  //     (index) =>
  //         Radio(value: index, groupValue: gValue, onChanged: updateRadio),
  //   );
  //   return widgets;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: createRadios(),

              //   Radio(value: 0, groupValue: gValue, onChanged: updateRadio),
              //   Text('Apple'),
            ),
            Text('You choose : $gValue'),
          ],
        ),
      ),
    );
  }
}
