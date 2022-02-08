import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwipeBox extends StatefulWidget {
  //for setting the card's first gradient color
  final Color color1;
  //for setting the card's second gradient color
  final Color color2;
  final Color backgroundcolor;

  final BorderRadius borderRadius1;

  final BorderRadius borderRadius2;

  final double height;

  final double width;

  final AssetImage image1;

  final int BoxCount;

  final double Position;

  final BoxShadow shadow;
  final Function ontap;
  final Text text1;
  final Text text2;
  final double ImageHeight;
  final double ImageWidhth;
  final double TextPosition_Top;
  final double TextPosition_Down;

  const SwipeBox(
      {Key key,
      @required this.color1,
      @required this.color2,
      @required this.borderRadius1,
      @required this.borderRadius2,
      @required this.height,
      @required this.width,
      @required this.image1,
      @required this.backgroundcolor,
      @required this.BoxCount,
      @required this.Position,
      @required this.shadow,
      @required this.ontap,
      @required this.text1,
      @required this.text2,
      this.ImageHeight,
      this.ImageWidhth,
      this.TextPosition_Top,
      this.TextPosition_Down})
      : super(key: key);

  @override
  _SwipeBoxState createState() => _SwipeBoxState();
}

class _SwipeBoxState extends State<SwipeBox>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _SwipeSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
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
                  boxShadow: [widget.shadow],
                  borderRadius: widget.borderRadius2,
                ),
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: "assets/images/plant1.png",
                        child: Image(
                          height: widget.ImageHeight,
                          width: widget.ImageWidhth,
                          image: widget.image1,
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
                          widget.text1,
                          widget.text2,
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
