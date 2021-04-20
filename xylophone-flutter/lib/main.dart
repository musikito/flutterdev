import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  void playSound(int noteIndex){
    player.play('note$noteIndex.wav');
  }
 Expanded drawKey({Color colores, int soundNumber}){
   return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        style: TextButton.styleFrom(
          backgroundColor: colores,
        ),
        // child: Text('Play me'),
      ),
    );

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
              drawKey(colores: Colors.red, soundNumber: 1),
              drawKey(colores: Colors.green, soundNumber: 2),
              drawKey(colores: Colors.teal, soundNumber: 3),
              drawKey(colores: Colors.yellow, soundNumber: 4),
              drawKey(colores: Colors.blue, soundNumber: 5),
              drawKey(colores: Colors.orange, soundNumber: 6),
              drawKey(colores: Colors.purple, soundNumber: 7),

            ],
          ),
        ),
      ),
    );
  }
}
