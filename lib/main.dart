import 'package:flutter/material.dart';
import 'UI/Ui Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Plant Shop UI',
      debugShowCheckedModeBanner: false,
      home: SwipeBox(
        color1: Colors.deepPurpleAccent,
        color2: Colors.yellowAccent,
        backgroundcolor: Colors.grey[900],
        borderRadius1: BorderRadius.circular(20),
        borderRadius2: BorderRadius.circular(20),
        height: 270.3,
        width: 240.2,
        BoxCount: 2,
      ),
    );
  }
}
