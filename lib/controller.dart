import 'package:flutter/material.dart';
import 'package:test_font_end/Screen/home.dart';
import 'package:test_font_end/Screen/matching.dart';

class Tranfor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "home",
      routes: {
        "home": (context) => Home(),
        "matching": (context) => Matching(),
      },
    );
  }
}

void toMatching(BuildContext context){
  Navigator.pushNamed(context, "matching");
}