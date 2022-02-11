import 'package:flutter/material.dart';
import 'package:Fluid_action_card/lib/FluidActionCard/fluid_action_card';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fluid Action card display',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: FluidActionCard(
            color1: Colors.greenAccent.shade400,
            color2: Colors.black12,
            backgroundcolor: Colors.grey[900]!,
            borderRadius1: BorderRadius.circular(20),
            borderRadius2: BorderRadius.circular(20),
            TextPosition_Top: 22.0,
            TextPosition_Down: 29.0,
            height: 400.0,
            width: 240.0,
            CardCount: 3,
            text1: Text(
              "Starts From",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic),
            ),
            text2: Text(
              "300",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0,
              ),
            ),
            Position: 250.0,
            shadow: BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 0.2,
              offset: Offset(0, 3),
            ),
            assetimage: 'assets/images/plant1.png',
            ontap: () {},
          ),
        ));
  }
}
