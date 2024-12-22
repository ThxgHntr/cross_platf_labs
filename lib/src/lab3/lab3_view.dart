import 'dart:math';

import 'package:flutter/material.dart';

class Lab3View extends StatefulWidget {
  const Lab3View({super.key});

  static const String routeName = '/lab3';
  static const String image = 'assets/icons/dice.png';

  @override
  State<Lab3View> createState() => _Lab3State();
}

class _Lab3State extends State<Lab3View> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void dice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
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
              Lab3View.image,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            // responsive text color
            Text(
              'Lab 3 - Dice',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: dice,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            'assets/images/dices/dice$leftDiceNumber.png'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            'assets/images/dices/dice$rightDiceNumber.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
