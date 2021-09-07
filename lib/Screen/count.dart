import 'dart:async';
import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CountDownState();
}

class CountDownState extends State<CountDown> {
  int _counter = 30;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          this._counter--;
        } else {
          this._timer.cancel();
          return;
        }
      });
    });
  }

  CountDownState(){
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Text(
        '$_counter',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          decoration: TextDecoration.none,
          color: Colors.white,
        ),       
      ),
      alignment: Alignment.center,
    );
  }
}
