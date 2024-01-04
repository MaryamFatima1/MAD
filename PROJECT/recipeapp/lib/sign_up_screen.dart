



// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, annotate_overrides, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
TextField(
  controller: passwordController,
  obscureText: true, // Set to true for password obscuring
  decoration: InputDecoration(
    labelText: 'Password',
  ),
),


            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Your sign-up logic here
                // You can store the sign-up data in a database or another storage solution
                // For simplicity, let's print the data for now (remove in production)
                debugPrint(
                    'Sign Up - Username: ${usernameController.text}, Password: ${passwordController.text}');
                Navigator.pop(
                    context); // Go back to the previous screen after sign-up
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}


