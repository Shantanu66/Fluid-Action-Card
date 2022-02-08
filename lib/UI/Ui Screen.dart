import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plant_shop_ui/Assets/ImagesDesc.dart';

class SwipeBox extends StatefulWidget {
 
  final Color color1;

  final Color color2;
  final Color backgroundcolor;
  
  final BorderRadius borderRadius1;
  
  final BorderRadius borderRadius2;
  
  final double height;
  
  final double width;
  
  final AssetImage image1;
  
  final int BoxCount;

  final double Position;

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
      @required this.Position})
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
                children: <Widget>[
                  Center(
                      child: Hero(
                        tag: plants[index].imageUrl,
                        child: Image(
                          height: 270.0,
                          width: 290.0,
                          image: widget.image1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
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
                padding: EdgeInsets.symmetric(vertical: 
                widget.Position),
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
