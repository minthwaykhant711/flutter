import 'package:flutter/material.dart';

class Assign1 extends StatefulWidget {
  const Assign1({super.key});

  @override
  State<Assign1> createState() => _Assign1State();
}

class _Assign1State extends State<Assign1> {
  DateTime _startDate = DateTime(2025, 10, 30);
  DateTime _endDate = DateTime(2025, 10, 30);
  String fromDate = '30/10/2025';
  String toDate = '30/10/2025';

  void showFromDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (dt != null) {
      setState(() {
        _startDate = dt;
        fromDate = '${dt.day}/${dt.month}/${dt.year}';
        if (_startDate.isAfter(_endDate)) {
          _endDate = _startDate;
          toDate = fromDate;
        }
      });
    }
  }

  void showToDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: _startDate,
      lastDate: DateTime(2101),
    );
    if (dt != null) {
      setState(() {
        _endDate = dt;
        toDate = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DatePicker Demo',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: showFromDate,
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('From'),
                  ),
                  SizedBox(width: 10),
                  Text(fromDate),
                ],
              ),

              Row(
                children: [
                  FilledButton.icon(
                    onPressed: showToDate,
                    icon: const Icon(Icons.calendar_month),
                    label: const Text('To'),
                  ),
                  SizedBox(width: 10),
                  Text(toDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
