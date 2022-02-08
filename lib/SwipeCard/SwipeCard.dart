import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwipeCard extends StatefulWidget {
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
  //for inserting image in the card
  final Image? image1;
  //for the number of cards the user wants
  final int BoxCount;
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
  //for setting image height of the card
  final double? ImageHeight;
  //for setting image width of the card
  final double? ImageWidhth;
  //for setting text position on the card
  final double? TextPosition_Top;
  //for setting text position on the card
  final double? TextPosition_Down;
  //for setting different images on each card using tags
  final Hero? hero;

  const SwipeCard(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.borderRadius1,
      required this.borderRadius2,
      required this.height,
      required this.width,
      this.image1,
      required this.backgroundcolor,
      required this.BoxCount,
      required this.Position,
      this.shadow,
      this.ontap,
      this.text1,
      this.text2,
      this.ImageHeight,
      this.ImageWidhth,
      this.TextPosition_Top,
      this.TextPosition_Down,
      this.hero})
      : super(key: key);

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard>
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

  _SwipeSelector(int index) {
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
                    Center(child: widget.hero),
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
                    width: widget.width,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _selectedPage = index;
                        });
                      },
                      itemCount: widget.BoxCount,
                      itemBuilder: (BuildContext context, int index) {
                        return _SwipeSelector(index);
                      },
                    ),
                  ),
                ])));
  }
}
