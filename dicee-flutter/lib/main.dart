import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftSideDice = 1;
  int rightSideDice = 1;

  void changeDiceFaces(){
    setState(() {
      leftSideDice = Random().nextInt(6)+1;
      rightSideDice = Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
               changeDiceFaces();
              },
              child: Image.asset('images/dice$leftSideDice.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFaces();
              },
              child: Image.asset('images/dice$rightSideDice.png'),
            ),
          ),
        ],
      ),
    );
  }
}


