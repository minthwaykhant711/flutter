import 'package:flutter/material.dart';

class Assign1 extends StatefulWidget {
  const Assign1({super.key});

  @override
  State<Assign1> createState() => _Assign1State();
}

class _Assign1State extends State<Assign1> {
  TextEditingController tcUsername = TextEditingController();
  TextEditingController tcPassword = TextEditingController();

  String loginResult = '';

  void login() {
    String username = tcUsername.text;
    String password = tcPassword.text;

    setState(() {
      if (username == 'test' && password == '1234') {
        loginResult = 'Welcome admin';
      } else {
        loginResult = 'Wrong username or password';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: tcUsername,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: tcPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 16),
            Text(
              loginResult,
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
