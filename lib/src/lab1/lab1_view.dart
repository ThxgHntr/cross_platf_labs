import 'package:flutter/material.dart';

class Lab1View extends StatelessWidget {
  const Lab1View({super.key});

  static const String routeName = '/lab1';
  static const String image = 'assets/icons/diamond_icon.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // responsive color
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.pink[800]
            : Colors.pinkAccent[100],
        title: Row(
          children: [
            Image.asset(
              image,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            // responsive text color
            Text(
              'Lab 1 - I Am Rich',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: Center(
        child: Image.asset('assets/images/diamond.webp'),
      ),
    );
  }
}

// ...existing code...
