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
      appBar: AppBar(
        title: const Text('Dice'),
      ),
      body: GestureDetector(
        onTap: dice,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            Image.asset('images/dices/dice$leftDiceNumber.png'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            'images/dices/dice$rightDiceNumber.png'),
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
