import 'package:flutter/material.dart';

class Lab1View extends StatelessWidget {
  const Lab1View({super.key});

  static const String routeName = '/lab1';
  static const String image = 'assets/icon/diamond_icon.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // responsive color
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/diamond_icon.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            // responsive text color
            Text(
              'Lab 1',
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
