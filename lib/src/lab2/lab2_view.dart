import 'package:flutter/material.dart';

class Lab2View extends StatelessWidget {
  const Lab2View({super.key});

  static const String routeName = '/lab2';
  static const String image = 'assets/icons/user_icon.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.pink[800]
            : Colors.pinkAccent[100],
        title: Row(
          children: [
            Image.asset(
              image,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            // responsive text color
            Text(
              'Lab 2 - Mi Card',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400.0, // Maximum width for the card
          ),
          child: Card(
            margin:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            elevation: 10.0,
            color: Colors.red[100],
            shadowColor: Colors.red[900],
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/121294842?v=4'),
                    radius: 50.0,
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Trịnh Đàm Huy',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'cursive', // Use a special, aesthetically pleasing font
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '21JIT',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily:
                          'cursive', // Use a special, aesthetically pleasing font
                      color: Colors.black,
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 20.0,
                    thickness: 0.5,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Colors.pink[800]),
                        const SizedBox(width: 10.0),
                        const Text(
                          '+84 123 456 789',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Colors.pink[800]),
                        const SizedBox(width: 10.0),
                        const Text(
                          'trinhdamhuy@gmail.com',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
