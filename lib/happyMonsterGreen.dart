import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'dart:ui' as ui;

double Mapping(double input, double input_start, double input_end, double output_start, double output_end){
  double input_range = input_end - input_start;
  double output_range = output_end - output_start;
  return (input - input_start)*output_range / input_range + output_start;
}

class HappyMonsterGreen extends StatefulWidget {
  HappyMonsterGreen({Key key}) : super(key: key);

  _HappyMonsterGreenState createState() => _HappyMonsterGreenState();
}

class _HappyMonsterGreenState extends State<HappyMonsterGreen>
    with TickerProviderStateMixin {
  double positionA = 0;
  double positionB = 0;
  double positionC = 0;
  double btnPostionX = -1;
  double btnWidth = 80.0;
  int selectIdx = 1;

  AnimationController animationController;
  Animation<double> animation;
  Tween<double> tween;

  AnimationController animationController_mouth;
  Animation<double> animation_mouth;

  @override
  void dispose() {
    animationController.dispose();
    animationController_mouth.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 50), vsync: this);

    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    tween = Tween(begin: 0.0, end: 0.0);
    animation = tween.animate(curve)
      ..addListener(() {
        btnPostionX = animation.value;
        setState(() {});
      });

    animationController_mouth = AnimationController(
        value: 0.0, duration: Duration(milliseconds: 500), vsync: this);
    animation_mouth =
        Tween(begin: 0.0, end: 40.0).animate(animationController_mouth)
          ..addListener(() {
            setState(() {});
          });
  }

  double getNewPosition() {
    switch (selectIdx) {
      case 0:
        return positionA - btnWidth / 2.0;
        break;

      case 1:
        return positionB - btnWidth / 2.0;
        break;

      case 2:
        return positionC - btnWidth / 2.0;
        break;
      default:
    }
  }

  moveToNearPosition() {
    tween.begin = btnPostionX;
    tween.end = getNewPosition();
    animationController.reset();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    //w=896.0  h=414.0
    // print("h=${MediaQuery.of(context).size.height}");
    // print("w=${MediaQuery.of(context).size.width}");

    positionA = 200;
    positionB = MediaQuery.of(context).size.width / 2;
    positionC = MediaQuery.of(context).size.width - 200;

    if (btnPostionX == -1) {
      btnPostionX = positionB - btnWidth / 2.0;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/monsterBG3.png")),
              )),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                      "What education level\nwould you like to set for Michael?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)))),
          CustomPaint(
            painter: MouthPaint(animation_mouth.value),
          ),
          ClipPath(
            clipper: MouthClipper(),
            child: Container(
              color: Colors.red.withOpacity(0),
              height: 300,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 0),
              child: Stack(
                children: <Widget>[
                  //tongue
                  Positioned(
                    top: 120,
                    left: btnPostionX,
                    child: GestureDetector(
                        onHorizontalDragStart: (DragStartDetails dragDetails) {
                          animationController_mouth.forward();
                        },
                        onHorizontalDragUpdate:
                            (DragUpdateDetails dragDetails) {
                          //print(dragDetails);
                          setState(() {
                            btnPostionX += dragDetails.delta.dx;
                          });
                        },
                        onHorizontalDragEnd: (DragEndDetails dragDetails) {
                          animationController_mouth.reverse();

                          double btnToA =
                              (btnPostionX - positionA + btnWidth / 2.0).abs();
                          double btnToB =
                              (btnPostionX - positionB + btnWidth / 2.0).abs();
                          double btnToC =
                              (btnPostionX - positionC + btnWidth / 2.0).abs();
                          int nearBy = [btnToA, btnToB, btnToC]
                              .indexOf([btnToA, btnToB, btnToC].reduce(min));
                          //print("nearBy=");
                          selectIdx = nearBy;
                          moveToNearPosition();
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 150,
                          width: btnWidth,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.55),
                                    blurRadius: 10)
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 232, 83, 108),
                                    Color.fromARGB(255, 232, 83, 108),
                                    Color.fromARGB(255, 230, 172, 162),
                                  ]),
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(FontAwesomeIcons.caretDown,
                                  color: Colors.white, size: 50)),
                        )),
                  ),
                  /*
                  //position1
                  Positioned(
                      top: 0,
                      left: positionA,
                      child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.yellow,
                      )),
                  //position2
                  Positioned(
                      top: 0,
                      left: positionB,
                      child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.yellow,
                      )),
                  //position3
                  Positioned(
                      top: 0,
                      left: positionC,
                      child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.yellow,
                      ))
                      */
                ],
              ),
            ),
          ),
          //Low, medium, high
          Container(
              margin: EdgeInsets.only(top: 290),
              padding: EdgeInsets.symmetric(horizontal: 80),
              height: 100,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text("Low",
                            style: TextStyle(
                                color: (selectIdx == 0)
                                    ? Colors.white
                                    : Color.fromARGB(255, 1, 94, 80),
                                fontSize: 35,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text("Medium",
                            style: TextStyle(
                                color: (selectIdx == 1)
                                    ? Colors.white
                                    : Color.fromARGB(255, 1, 94, 80),
                                fontSize: 35,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text("High",
                            style: TextStyle(
                                color: (selectIdx == 2)
                                    ? Colors.white
                                    : Color.fromARGB(255, 1, 94, 80),
                                fontSize: 35,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                ],
              )),

          //leftBtn
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: FlatButton(
                    onPressed: () {},
                    child: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                      size: 30,
                    ),
                  ))),
          //rightBtn
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: FlatButton(
                    color: Colors.red,
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                          size: 30,
                        )),
                  ))),
          //left eye
          Positioned(
            // top: 100,
            // left: 290,
            top: 100,
            //left: 290+(btnPostionX-290)*1/10.0,
            left: Mapping(290+(btnPostionX-290)*1/10.0,0,896,0,896),
            
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/monsterEyes.png")),
              ),
            ),
          ),
          //right eye
          Positioned(
            // top: 100,
            // left: 590,
            top: 100,
            left: 590+(btnPostionX-590)*1/10.0,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/monsterEyes.png")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MouthPaint extends CustomPainter {
  double mouthOffsetY = 0;
  MouthPaint(this.mouthOffsetY);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..isAntiAlias = false
      ..shader = ui.Gradient.linear(
          Offset(size.width / 2, 100), Offset(size.width / 2, 250), [
        Color.fromARGB(255, 1, 68, 59),
        Color.fromARGB(255, 27, 129, 112),
      ]);
    // ..color = Colors.red
    // ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(37.4, 134)

      //bottom left
      ..cubicTo(35.7, 175.4, 63.2, 207.4, 110, 216)
      ..cubicTo(150, 218 + mouthOffsetY, 352.5, 220 + mouthOffsetY, 448,
          208 + mouthOffsetY)

      //bottom right
      ..cubicTo(547, 209 + mouthOffsetY, 730, 239.6 + mouthOffsetY, 828, 213.4)
      ..cubicTo(877, 198, 865, 143, 836, 140)

      //top right
      ..cubicTo(706, 184, 552, 187, 449, 189)

      //top left
      ..cubicTo(324, 206, 152, 155, 53, 132)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MouthPaint oldDelegate) => true;
}

class MouthClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 134)
      ..lineTo(0, 300)
      ..lineTo(size.width, 300)
      ..cubicTo(877, 198, 865, 143, 836, 140)

      //top right
      ..cubicTo(706, 184, 552, 187, 449, 189)

      //top left
      ..cubicTo(324, 206, 152, 155, 53, 132)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
