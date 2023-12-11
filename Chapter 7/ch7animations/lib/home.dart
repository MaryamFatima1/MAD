import 'package:ch7animations/Widgets/animatedbaloon.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get flexibleSpace => null;


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Column(
              children: <Widget>[
                AnimatedBalloonWidget(),
              ],
            ),
        ),
        );
    }
}