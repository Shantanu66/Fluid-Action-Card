<h1 align="center" xmlns="http://www.w3.org/1999/html">
  <br>
   <img src="https://user-images.githubusercontent.com/64373963/158168111-a773b83e-71be-47dd-a43b-8e12b0c33c8d.png" width=860 />
  <br>
</h1>


<p align="center">
  <img src="https://img.shields.io/pub/v/fluid_action_card?color=%23004088&logo=flutter">
  <img src="https://img.shields.io/github/license/Shantanu66/Fluid-Action-Card?color=%23A100FF">
  <img src="https://img.shields.io/badge/Animation%20-Package-yellow">
  <img src="https://img.shields.io/github/repo-size/Shantanu66/Fluid-Action-Card?color=orange">
  <img src="https://img.shields.io/github/stars/Shantanu66/Fluid-Action-Card?style=social">
</p>




# Fluid action card Package

A `Flutter` package consisting of `pre-animated cards(containers)` with `fluid animation` for freely adding `user customized` cards to the app with heavily customizable options for the cards adding up to an incredible UI experience.You can set the amount of cards for your screen to display without writing code for creating additonal cards and also writing your own animation mechanism.You can also add multiple `texts and images` in the card and also customize its color which is in `gradient form` with various attributes making it a complete package for modern `UI development`.


# Preview 
![Screenshot 2022-03-16 135641](https://user-images.githubusercontent.com/64373963/158547901-a374f7d2-5b32-4a35-8999-fe1e73052364.png)

# Demo
<p align="center">
<img src="https://user-images.githubusercontent.com/64373963/158566922-07af4787-a543-4ccb-866a-8883b10d533d.gif">
</p>

# Installation
You should have [Flutter](https://flutter.dev/) installed in your System.<br/>
> Now in your terminal <br/>
* Run this command:<br/>

    $ flutter pub add fluid_action_card
    
  



# Example and Usage:

<p align="center">
<img src="https://user-images.githubusercontent.com/64373963/153234878-f23e4f19-1ef5-4e55-8bd8-c52249b59459.png" width="310" height="520">
</p>


```dart

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fluid Action card display',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: FluidActionCard(
            color1: Colors.pinkAccent,
            color2: Colors.black45,
            backgroundcolor: Colors.grey[900]!,
            borderRadius1: BorderRadius.circular(20),
            borderRadius2: BorderRadius.circular(20),
            height: 400.0,
            width: 240.0,
            cardCount: 6,
            Position: 250.0,
            shadow: BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 0.2,
              offset: Offset(0, 3),
            ),
            ontap: () {},
           ),
        )
      );
  }
}
```
<p align="center">
<img src="https://user-images.githubusercontent.com/64373963/153338603-e4072f98-1fcc-4bcb-a3b0-f2f0c4a979bf.png" width="310" height="460">

> To add images to the animated cards follow this procedure:
* First import the dependancy assets to pubspec.yaml

```dart
flutter:
  uses-material-design: true

  assets:
    - assets/images/
```

```dart
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
            assetimage: 'assets/images/Xbox.png',
            ontap: () {},
          ),
        ));
  }
}
```
# Support the Library
You can support the library by liking it on pub, staring in on Github and reporting any bugs you encounter.Feel Free to add to it and make it better by contributing to it
