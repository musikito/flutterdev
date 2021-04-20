import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  void playSound(int noteIndex){
    player.play('note$noteIndex.wav');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                   playSound(1);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  // child: Text('Play me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(2);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  // child: Text('Play me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(3);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  // child: Text('Play me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(4);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  // child: Text('Play me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(5);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  // child: Text('Play me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(6);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  // child: Text('Play me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    playSound(7);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  // child: Text('Play me'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
