import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwipeBox extends StatefulWidget {
  @required
  final Color color1;
  @required
  final Color color2;
  @required
  final Color backgroundcolor;
  @required
  final BorderRadius borderRadius1;
  @required
  final BorderRadius borderRadius2;
  @required
  final double height;
  @required
  final double width;
  @required
  final AssetImage image1;
  @required
  final int BoxCount;

  const SwipeBox(
      {Key key,
      this.color1,
      this.color2,
      this.borderRadius1,
      this.borderRadius2,
      this.height,
      this.width,
      this.image1,
      this.backgroundcolor,
      this.BoxCount})
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
                borderRadius: widget.borderRadius2,
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[],
              ),
            ),
          ),
        ],
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
                padding: EdgeInsets.symmetric(vertical: 190.0),
                children: <Widget>[
                  Container(
                    height: 500.0,
                    width: double.infinity,
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
