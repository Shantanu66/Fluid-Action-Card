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
        height: 400.3,
        width: 240.2,
        BoxCount: 2,
        image1: AssetImage(
          "assets/images/plant0.png",
        ),
        Position: 250.0,
        shadow: BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          spreadRadius: 0.2,
          offset: Offset(0, 3),
        ),
        
      ),
    );
  }
}
