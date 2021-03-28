import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'კამათელი',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.teal,
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
  int leftDice = 1;
  int rigthDice = 1;

  void diceChange() {
    setState(() {
      final player = AudioCache();
      player.play("sound.mp3");
      leftDice = Random().nextInt(6) + 1;
      // print("Left Dice Number = $leftDice");
      rigthDice = Random().nextInt(6) + 1;
      // print("Right Dice Number = $rigthDice");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    diceChange();
                  },
                  child: Image.asset("images/dice$leftDice.png"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    diceChange();
                  },
                  child: Image.asset("images/dice$rigthDice.png"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () {
              diceChange();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Text(
                "კამათლის გაგორება",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
