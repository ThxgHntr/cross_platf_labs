import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Lab5View extends StatefulWidget {
  const Lab5View({super.key});

  static const String routeName = '/lab5';
  static const String image = 'assets/icons/xylophone.png';

  @override
  State<Lab5View> createState() => _Lab5State();
}

class NoteItem {
  final String src;
  final Color color;

  NoteItem({
    required this.src,
    required this.color,
  });
}

class _Lab5State extends State<Lab5View> {
  late AudioPlayer player = AudioPlayer();

  List<NoteItem> notes = [
    NoteItem(src: 'audio/note1.wav', color: Colors.red),
    NoteItem(src: 'audio/note2.wav', color: Colors.orange),
    NoteItem(src: 'audio/note3.wav', color: Colors.yellow),
    NoteItem(src: 'audio/note4.wav', color: Colors.green),
    NoteItem(src: 'audio/note5.wav', color: Colors.teal),
    NoteItem(src: 'audio/note6.wav', color: Colors.blue),
    NoteItem(src: 'audio/note7.wav', color: Colors.purple),
  ];

  @override
  void initState() {
    super.initState();

    // Create the audio player.
    player = AudioPlayer();
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();

    super.dispose();
  }

  void playSound(String soundFile) {
    player.play(AssetSource(soundFile));
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
              Lab5View.image,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            // responsive text color
            Text(
              'Lab 5 - Xylophone',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var note in notes)
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(note.src);
                  },
                  child: Container(
                    height: 100.0,
                    width: double.infinity,
                    color: note.color,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
