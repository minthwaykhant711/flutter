import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  Widget createDrawer(context) {
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
              Navigator.pop(context);
            },
            label: Text('Page 1'),
            icon: Icon(Icons.access_alarm),
          ),

          TextButton.icon(
            onPressed: () {
              //close the drawer
              Navigator.pop(context);
            },
            label: Text('Page 2'),
            icon: Icon(Icons.access_alarm),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: createDrawer(context),
      drawerEnableOpenDragGesture: false,
      body: Align(alignment: Alignment.topCenter, child: Text('Welcome Page')),
    );
  }
}
