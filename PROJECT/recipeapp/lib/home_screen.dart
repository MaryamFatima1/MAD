// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Added const for performance
      ),
      body: Center(
        child: const Text(
            'Welcome to the Home Screen!'), // Added const for performance
      ),
    );
  }
}
