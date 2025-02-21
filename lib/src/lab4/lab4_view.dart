import 'dart:math';

import 'package:flutter/material.dart';

class Lab4View extends StatefulWidget {
  const Lab4View({super.key});

  static const String routeName = '/lab4';
  static const String image = 'assets/icons/ball.png';

  @override
  State<Lab4View> createState() => _Lab4State();
}

class _Lab4State extends State<Lab4View> {
  int ballNum = 1;

  void ball() {
    setState(() {
      ballNum = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.pink[800]
            : Colors.pinkAccent[100],
        title: Row(
          children: [
            Image.asset(
              Lab4View.image,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            // responsive text color
            Text(
              'Lab 4 - Magic 8 Ball',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: ball,
        child: Center(
          child: Image.asset('assets/images/balls/ball$ballNum.png'),
        ),
      ),
    );
  }
}
