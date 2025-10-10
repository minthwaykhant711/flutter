import 'package:flutter/material.dart';

class DropdownDemo extends StatefulWidget {
  const DropdownDemo({super.key});

  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<DropdownDemo> {
  int ddValue = 0;
  List fruits = ['Apple', 'Banana', 'Orange', 'Papaya'];

  void updateDropdown(int? value) {
    setState(() {
      ddValue = value!;
    });
  }

  //dynamic example
  List<DropdownMenuItem<int>> createDropdown() {
    return List.generate(
      fruits.length,
      (index) => DropdownMenuItem(value: index, child: Text(fruits[index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButton(
                value: ddValue,
                items:
                    // DropdownMenuItem(value: 0, child: Text('apple')),
                    // DropdownMenuItem(value: 1, child: Text('banana')),
                    // DropdownMenuItem(value: 2, child: Text('orange')),
                    // DropdownMenuItem(value: 3, child: Text('lemon')),
                    createDropdown(),

                onChanged: updateDropdown,
              ),
              Text('You choose : $ddValue'),
            ],
          ),
        ),
      ),
    );
  }
}
