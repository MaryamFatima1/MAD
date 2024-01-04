import 'package:flutter/material.dart';
import 'package:foodapp/screens/add_dish_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  WelcomeScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $username!'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_dish');
              },
              child: Text('Go to Add Dish'),
            ),
          ],
        ),
      ),
    );
  }
}