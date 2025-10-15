import 'package:flutter/material.dart';

class Assign3 extends StatefulWidget {
  const Assign3({super.key});

  @override
  State<Assign3> createState() => _Assign3State();
}

class _Assign3State extends State<Assign3> {
  bool _isIced = false;
  double _sugarlevel = 0;
  String? _thankYouMessage;

  String? selectedCoffee = 'Latte';
  Map<String, int> coffee = {'Latte': 35, 'Americano': 30, 'Cappuccino': 40};

  List<Widget> createRadio() {
    List<Widget> widgets = [];
    for (String coffeename in coffee.keys) {
      widgets.add(
        Row(
          children: [
            Radio<String>(
              value: coffeename,
              groupValue: selectedCoffee,
              onChanged: (String? value) {
                setState(() {
                  selectedCoffee = value;
                });
              },
            ),
            Text(coffeename),
            SizedBox(width: 8),
            Text('${coffee[coffeename]} Baht'),
          ],
        ),
      );
    }
    return widgets;
  }

  String _getCoffeeType() {
    String temperature = _isIced ? 'Iced' : 'Hot';
    String name = selectedCoffee ?? '';
    return '$temperature $name';
  }

  String _getSugarLevel() {
    if (_sugarlevel == 0) {
      return 'no';
    } else if (_sugarlevel == 50) {
      return 'less';
    } else {
      return 'normal';
    }
  }

  String _coffeeImage() {
    const coffeeFileNames = {
      'Latte': 'lattee',
      'Americano': 'americano',
      'Cappuccino': 'cap',
    };

    String temp = _isIced ? 'iced' : 'hot';
    String baseName = coffeeFileNames[selectedCoffee] ?? '';

    String extension = (selectedCoffee == 'Cappuccino' && !_isIced)
        ? '.jpeg'
        : '.jpg';

    return 'assets/images/${temp}_$baseName$extension';
  }

  void _showOrderDialog() {
    int basePrice = coffee[selectedCoffee] ?? 0;
    int finalPrice = _isIced ? basePrice + 5 : basePrice;

    String orderSummary =
        '${_getCoffeeType()} with ${_getSugarLevel()} sugar.\n Price = $finalPrice Baht';
    String imagePath = _coffeeImage();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Your Order'),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(orderSummary),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _thankYouMessage = 'Thank you! Your order has been received.';
                });
                Future.delayed(const Duration(seconds: 3), () {
                  if (mounted) {
                    setState(() {
                      _thankYouMessage = null;
                    });
                  }
                });
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'MFU Coffee Shop',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Your Order',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Coffee',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Column(children: createRadio()),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text('Hot'),
                Switch(
                  value: _isIced,
                  onChanged: (bool value) {
                    setState(() {
                      _isIced = value;
                    });
                  },
                ),
                Text('Cold (+5)'),
              ],
            ),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Sugar', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text('None'),
                SizedBox(width: 10),
                Slider(
                  min: 0,
                  max: 100,
                  divisions: 2,
                  label: _getSugarLevel().split('  ')[0],
                  value: _sugarlevel,
                  onChanged: (double value) {
                    setState(() {
                      _sugarlevel = value;
                    });
                  },
                ),
                Text('Normal'),
              ],
            ),
            SizedBox(height: 15),

            FilledButton(onPressed: _showOrderDialog, child: Text('ORDER')),
            const SizedBox(height: 10),
            if (_thankYouMessage != null)
              Text(
                _thankYouMessage!,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
