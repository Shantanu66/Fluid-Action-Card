import 'package:flutter/material.dart';
import 'SwipeCard/SwipeCard.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe card display',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SwipeCard(
        color1: Colors.pinkAccent,
        color2: Colors.black45,
        backgroundcolor: Colors.grey[900],
        borderRadius1: BorderRadius.circular(20),
        borderRadius2: BorderRadius.circular(20),
        TextPosition_Top: 22.0,
        TextPosition_Down: 29.0,
        ImageHeight: 260.0,
        ImageWidhth: 290.0,
        height: 400.0,
        width: 240.0,
        BoxCount: 6,
        //image1:, 
        Position: 250.0,
        shadow: BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          spreadRadius: 0.2,
          offset: Offset(0, 3),
        ),
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(),
          );
        },
        text1: Text(
          'STARTS FROM',
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontStyle: FontStyle.italic),
        ),
        text2: Text(
          '300',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
          ),
        ),
        
      ),
      )
    );
  }
}
