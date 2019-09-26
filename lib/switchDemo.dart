import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:ui' show lerpDouble;

class SwitchDemo extends StatefulWidget {
  SwitchDemo({Key key}) : super(key: key);

  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //background
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 226, 235, 237),
                Color.fromARGB(255, 235, 239, 235),
                Color.fromARGB(255, 245, 245, 235),
              ])),
        ),
        //switch
        Transform.scale(
          scale: 1.0,
          child: SizedBox(width: 300, height: 110, child: Switch())
        )
      ],
    ));
  }
}

class Switch extends StatefulWidget {
  Switch({Key key}) : super(key: key);

  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  double _btnPositionX = 5.0;
  double _sunRotateDegree = 0.0;
  double _moonRotateDegree = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //print("w=${constraints.maxWidth},h=${constraints.maxHeight}");

        return Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(constraints.maxHeight / 2.0),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ]),
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(constraints.maxHeight / 2.0),
                //background color
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.lerp(
                            Color.fromARGB(255, 32, 113, 222),
                            Color.fromARGB(255, 33, 49, 62),
                            (_btnPositionX - 5) / 195.0),
                        Color.lerp(
                            Color.fromARGB(255, 45, 172, 250),
                            Color.fromARGB(255, 6, 93, 129),
                            (_btnPositionX - 5) / 195.0),
                        // Color.fromARGB(255, 33, 49, 62),
                        // Color.fromARGB(255, 6, 93, 129),
                        // Color.fromARGB(255, 32, 113, 222),
                        // Color.fromARGB(255, 45, 172, 250),
                      ])),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      //sun
                      Positioned(
                          left: 100,
                          top: -150,
                          child: Transform(
                              transform: Matrix4.rotationZ(
                                  pi / 180 * -_sunRotateDegree), //0-40
                              alignment: FractionalOffset.topLeft,
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: ExactAssetImage(
                                          "assets/images/sun.png")),
                                ),
                              ))),
                      //wave1
                      Positioned(
                          left: 0,
                          top: 54,
                          child: Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: ExactAssetImage(
                                      "assets/images/wave1.png")),
                            ),
                          )),
                      //wave2
                      Positioned(
                          left: 0,
                          top: 54,
                          child: Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: ExactAssetImage(
                                      "assets/images/wave2.png")),
                            ),
                          )),
                      //moon
                      Positioned(
                          left: -70,
                          top: -130,
                          child: Transform(
                              transform: Matrix4.rotationZ(pi /
                                  180 *
                                  (40 - _sunRotateDegree + 4)), //0-40
                              alignment: FractionalOffset.topRight,
                              child: Container(
                                width: 220,
                                height: 220,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: ExactAssetImage(
                                          "assets/images/moon.png")),
                                ),
                              ))),
                      //star1
                      Positioned(
                          left: 70,
                          top: Offset.lerp(Offset(70, -50), Offset(70, 20),
                                  _btnPositionX / (195 - 5))
                              .dy, //20...-50  //lerpDouble(30,30,0.1),
                          child: Transform(
                              transform: Matrix4.translation(
                                  vector.Vector3(0, 0, 0)),
                              alignment: FractionalOffset.topRight,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: ExactAssetImage(
                                          "assets/images/star.png")),
                                ),
                              ))),
                      //star2
                      Positioned(
                          left: 130,
                          top: Offset.lerp(Offset(70, -40), Offset(70, 0),
                                  _btnPositionX / (195 - 5))
                              .dy, //0..-40
                          child: Transform(
                              transform: Matrix4.translation(
                                  vector.Vector3(0, 0, 0)), //0-40
                              alignment: FractionalOffset.topRight,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: ExactAssetImage(
                                          "assets/images/star.png")),
                                ),
                              ))),
                      //circle btn
                      Positioned(
                          top: 5,
                          left:
                              _btnPositionX, //min:5 max: constraints.maxWidth-constraints.maxHeight+5
                          child: GestureDetector(
                              onHorizontalDragStart:
                                  (DragStartDetails dragDetails) {},
                              onHorizontalDragUpdate:
                                  (DragUpdateDetails dragDetails) {
                                _btnPositionX += dragDetails.delta.dx;
                                _btnPositionX = _btnPositionX.clamp(
                                    5.0,
                                    constraints.maxWidth -
                                        constraints.maxHeight +
                                        5.0);

                                double btnMoveMaxDistance = 195.0;

                                _sunRotateDegree = 40.0 /
                                    (btnMoveMaxDistance - 5) *
                                    _btnPositionX;

                                //print(
                                //"_btnPositionX=${_btnPositionX}, _sunRotateDegree=${_sunRotateDegree}");

                                setState(() {});
                              },
                              onHorizontalDragEnd:
                                  (DragEndDetails dragDetails) {
                                if ((_btnPositionX +
                                        constraints.maxHeight / 2.0) <=
                                    constraints.maxWidth / 2.0) {
                                  _btnPositionX = 5;
                                } else {
                                  _btnPositionX = constraints.maxWidth -
                                      constraints.maxHeight +
                                      5;
                                }

                                double btnMoveMaxDistance = 195.0;

                                _sunRotateDegree = 40.0 /
                                    (btnMoveMaxDistance - 5) *
                                    _btnPositionX;

                                //print(
                                //"_btnPositionX=${_btnPositionX}, _sunRotateDegree=${_sunRotateDegree}");

                                setState(() {});
                              },
                              //circle btn
                              child: Container(
                                  width: constraints.maxHeight - 10.0,
                                  height: constraints.maxHeight - 10.0,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 4,
                                            offset: Offset(2, 2))
                                      ],
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 231, 235, 236),
                                            Color.fromARGB(255, 228, 228, 228),
                                            Color.fromARGB(255, 222, 222, 222),
                                          ]),
                                      shape: BoxShape.circle))))
                    ],
                  ),
                )));
      },
    );
  }
}