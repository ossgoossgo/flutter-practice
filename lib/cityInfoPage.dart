import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class CityInfoPage extends StatefulWidget {
  CityInfoPage({Key key}) : super(key: key);

  _CityInfoPageState createState() => _CityInfoPageState();
}

class _CityInfoPageState extends State<CityInfoPage> {
  double _btnInterval = 24;
  double get _btnStartDegree => _btnInterval / 2.0;
  int _badgeNumber = 0;

  StreamController streamCtr = StreamController();

  @override
  void dispose() {
    streamCtr.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          //blur layer
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.ocregister.com/wp-content/uploads/migration/o3s/o3s9jl-lede002.snow.030916.mr.jpg")),
            ),
            child: ClipPath(
                clipper: CircleClipper(),
                child: Container(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black38,
                    ),
                  ),
                )),
          ),
          Container(
            color: Colors.black26,
          ),
          //circle
          Container(
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          ),
          Positioned(
              top: 300,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: 400,
                width: 200 + 10.0,
                // color: Colors.red.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("CITY OF",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    Text("ALISO VIEJO",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    Divider(
                      color: Colors.white,
                      endIndent: 12,
                    ),
                    Text("Wednesday",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.9))),
                    Text("January 2013",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.9))),
                    Divider(
                      color: Colors.white,
                      endIndent: 13,
                    ),
                    Row(
                      children: <Widget>[
                        Text("50º",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.9))),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          FontAwesomeIcons.cloudSunRain,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    ),
                  ],
                ),
              )),
          //top navigation bar
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: Stack(
                        overflow: Overflow.visible,
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.bars,
                                color: Colors.white,
                                size: 40,
                              )),
                          StreamBuilder(
                            stream: streamCtr.stream,
                            initialData: 0,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return (snapshot.data > 0)
                                  ? BadgeNumberWidget(badgeNum: snapshot.data)
                                  : Container(
                                      width: 0,
                                      height: 0,
                                    );
                            },
                          )
                        ],
                      )),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            _badgeNumber += 1;
                            if (_badgeNumber > 999) _badgeNumber = 999;
                            streamCtr.sink.add(_badgeNumber);
                          },
                          icon: Icon(
                            FontAwesomeIcons.calendarAlt,
                            color: Colors.white,
                            size: 40,
                          ))
                    ],
                  ))),
          Btn(
              degree: -_btnStartDegree - _btnInterval * 2,
              icon: FontAwesomeIcons.building,
              title: "CITY HALL"),
          Btn(
              degree: -_btnStartDegree - _btnInterval,
              icon: FontAwesomeIcons.businessTime,
              title: "BUSINESSES"),
          Btn(
              degree: -_btnStartDegree,
              icon: FontAwesomeIcons.mapMarkerAlt,
              title: "PLACES"),
          Btn(
              degree: _btnStartDegree,
              icon: FontAwesomeIcons.newspaper,
              title: "NEWS"),
          Btn(
              degree: _btnStartDegree + _btnInterval,
              icon: FontAwesomeIcons.drumstickBite,
              title: "FOOD"),
          Btn(
              degree: _btnStartDegree + _btnInterval * 2,
              icon: FontAwesomeIcons.exclamation,
              title: "REPORTS")
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(0.0, 500), 200 + 10.0, paint);
    canvas.drawCircle(Offset(0.0, 500), 200 + 90.0, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclePainter oldDelegate) => false;
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path1 = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    Rect rect = Rect.fromCircle(center: Offset(0.0, 500), radius: 200);

    Path path2 = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset(0.0, 500), width: 400, height: 400),
          Radius.circular(200)));

    //..arcTo(rect, 0, pi * 2, false) //<== can't set degree value 0-360 0-pi*2 = 0 degree
    //..close();

    Path path3 = Path.combine(PathOperation.difference, path1, path2);
    return path3;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Btn extends StatelessWidget {
  final double degree;
  final IconData icon;
  final String title;

  const Btn({Key key, this.degree, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 500 - 40.0 + sin(pi / 180 * degree) * 290,
      left: -40.0 + cos(pi / 180 * degree) * 290,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 57, 75),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)),
            child: Container(
              // color: Colors.red,
              child: Icon(
                icon,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(90, 0),
              child: Container(
                  width: 500,
                  // color: Colors.blue,
                  child: Text(title,
                      style: TextStyle(fontSize: 16, color: Colors.white))))
        ],
      ),
    );
  }
}

class BadgeNumberWidget extends StatefulWidget {
  final int badgeNum;

  BadgeNumberWidget({Key key, this.badgeNum}) : super(key: key);

  _BadgeNumberWidgetState createState() => _BadgeNumberWidgetState();
}

class _BadgeNumberWidgetState extends State<BadgeNumberWidget>
    with TickerProviderStateMixin {
  AnimationController animationCtr;
  Animation animation;
  int currentBadgeNum = 0;

  @override
  void dispose() {
    animationCtr.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationCtr = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    animation = TweenSequence<double>([
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.3), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 1.3, end: 1.0), weight: 1),
    ]).animate(animationCtr)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed) {
          //animationCtr.reset();
        }
      });

  }

  @override
  Widget build(BuildContext context) {
    if (currentBadgeNum != widget.badgeNum) {
      //animationCtr.reset();
      animationCtr.stop();
      animationCtr.forward(from: 0.0);
      currentBadgeNum = widget.badgeNum;
    }

    return Container(
      child: Positioned(
          top: 0,
          left: 20,
          child: ScaleTransition(
              scale: animation,
              child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 36),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.red.withOpacity(0.9),
                      ),
                      child: Text(
                        widget.badgeNum.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ))))),
    );
  }
}
