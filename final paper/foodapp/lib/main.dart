import 'package:flutter/material.dart';
import 'package:foodapp/screens/signin_screen.dart';
import 'package:foodapp/screens/signup_screen.dart' as SignUpScreen;
import 'package:foodapp/screens/home_screen.dart';
import 'package:foodapp/screens/add_dish_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ... your theme configuration
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => const SigninScreen(),
        '/signup': (context) => SignUpScreen.SignupScreen(),
        '/welcome': (context) => WelcomeScreen(username: 'John'),
         '/add_dish': (context) => AddDishScreen(),
      },
    );
  }
}

