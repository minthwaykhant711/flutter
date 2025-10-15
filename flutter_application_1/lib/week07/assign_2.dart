import 'package:flutter/material.dart';

class Assign2 extends StatefulWidget {
  const Assign2({super.key});

  @override
  State<Assign2> createState() => _Assign2State();
}

class _Assign2State extends State<Assign2> {
  bool _isIced = false;
  double _sugarlevel = 0;

  String _getCoffeeType() {
    return _isIced ? 'Iced Coffee' : 'Hot Coffee';
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

  void _showOrderDialog() {
    String orderSummary = '${_getCoffeeType()} with ${_getSugarLevel()} sugar';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Your Order'),
          content: Text(orderSummary),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
            Row(
              children: [
                Text('Type'),
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
                Text('Cold'),
              ],
            ),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Sugar level'),
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
          ],
        ),
      ),
    );
  }
}
