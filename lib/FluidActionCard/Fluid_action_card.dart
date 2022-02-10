import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FluidActionCard extends StatefulWidget {
  //for setting the card's first gradient color
  final Color color1;
  //for setting the card's second gradient color
  final Color color2;
  //for setting the screen(container) background color
  final Color backgroundcolor;
  //for setting the card's borderradius and shape
  final BorderRadius borderRadius1;
  //for setting the card's borderradius and shape
  final BorderRadius borderRadius2;
  //for setting the card's height
  final double height;
  //for setting the card's width
  final double width;
  //for the number of cards the user wants
  final int CardCount;
  //for setting the position of the card
  final double Position;
  //for setting the shadow of the card
  final BoxShadow? shadow;
  //for gesture detection of the card
  final Function? ontap;
  //for adding text to the card
  final Text? text1;
  //for adding text to the card
  final Text? text2;
  //for setting text position on the card
  final double? TextPosition_Top;
  //for setting text position on the card
  final double? TextPosition_Down;
  //for setting image url
  final String assetimage;

  const FluidActionCard(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.borderRadius1,
      required this.borderRadius2,
      required this.height,
      required this.width,
      required this.backgroundcolor,
      required this.CardCount,
      required this.Position,
      this.shadow,
      this.ontap,
      this.text1,
      this.text2,
      this.TextPosition_Top,
      this.TextPosition_Down,
      required this.assetimage})
      : super(key: key);

  @override
  _FluidActionCardState createState() => _FluidActionCardState();
}

class _FluidActionCardState extends State<FluidActionCard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _ActionSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController!.position.haveDimensions) {
          value = (_pageController!.page! - index);
          value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 430.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          widget.ontap;
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: widget.borderRadius1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        widget.color1,
                        widget.color2,
                      ]),
                  boxShadow: [widget.shadow!],
                  borderRadius: widget.borderRadius2,
                ),
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Center(
                        child: Image(
                          height: 270.0,
                          width: 290.0,
                          image: AssetImage(
                            widget.assetimage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: widget.TextPosition_Top,
                      right: widget.TextPosition_Down,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          if (widget.text1 != null) widget.text1!,
                          if (widget.text2 != null) widget.text2!,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundcolor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: widget.Position),
                children: <Widget>[
                  Container(
                    height: widget.height,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _selectedPage = index;
                        });
                      },
                      itemCount: widget.CardCount,
                      itemBuilder: (BuildContext context, int index) {
                        return _ActionSelector(index);
                      },
                    ),
                  ),
                ])));
  }
}
