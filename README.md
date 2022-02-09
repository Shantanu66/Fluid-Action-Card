# Fluid action card Package

A Flutter package consisting of pre animated cards(containers) with fluid animation for freely adding user customized cards to the app with heavily customizable options for the cards adding up to an incredible UI experience.You can set the amount of cards for your screen to display without writing code for creating additonal cards and also writing your own animation mechanism.You can also add multiple texts,images in the card and also customize its color which is in gradient form with various attributes making it a complete package for modern frontend development.

# Preview 
![image](https://user-images.githubusercontent.com/64373963/153223791-882138dc-379b-4d9a-b727-85540ffabdf4.jpg)

# Demo
![ezgif com-gif-maker](https://user-images.githubusercontent.com/64373963/153229976-95615ec5-6de1-40d7-8e98-fb188252e5de.gif)

# Example
* ![Screenshot 2022-02-09 205025](https://user-images.githubusercontent.com/64373963/153231696-a03b8f22-b43c-4d13-b9dc-fd7be6fddeee.png)

```
import 'package:flutter/material.dart';
import 'package:fluid_action_card/FluidActionCard/Fluid_action_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Swipe card display',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: FluidActionCard(
            color1: Colors.pinkAccent,
            color2: Colors.black45,
            backgroundcolor: Colors.grey[900]!,
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
            ontap: () {},
            
            
          ),
        ));
  }
}
```
