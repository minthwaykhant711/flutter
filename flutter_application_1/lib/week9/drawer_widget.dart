import 'package:flutter/material.dart';
import 'package:flutter_application_1/week9/drawer_demo.dart';
import 'package:flutter_application_1/week9/drawer_demo2.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              children: [
                Image.asset('assets/images/batman.png', width: 100),
                Text('Header'),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {
              //close the drawer
              // Navigator.pop(context);
              //go to page 2 without history
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DrawerDemo()),
              );
            },
            label: Text('Page 1'),
            icon: Icon(Icons.access_alarm),
          ),

          TextButton.icon(
            onPressed: () {
              //close the drawer
              // Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DrawerDemo2()),
              );
            },
            label: Text('Page 2'),
            icon: Icon(Icons.access_alarm),
          ),
        ],
      ),
    );
    ;
  }
}
