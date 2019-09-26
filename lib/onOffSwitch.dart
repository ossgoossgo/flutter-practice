import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnOffSwitch extends StatefulWidget {
  OnOffSwitch({Key key}) : super(key: key);

  _OnOffSwitchState createState() => _OnOffSwitchState();
}

class _OnOffSwitchState extends State<OnOffSwitch> {
  double _switchBtnPostionY = 450.0;

  @override
  void initState() {
    super.initState();

    //hidden status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Color _get_black_to_yellow_Color() {
    //450.0-560.0;
    return Color.lerp(
        Color.fromARGB(255, 33, 31, 42),
        Color.fromARGB(255, 243, 215, 27),
        (_switchBtnPostionY - 450.0) / (560.0 - 450.0));
  }

  Color _get_white_to_black_Color() {
    //450.0-560.0;
    return Color.lerp(Colors.white, Colors.black,
        (_switchBtnPostionY - 450.0) / (560.0 - 450.0));
  }

  //yellor=0.2, black=0.9
  double _get_opacity() {
    return prefix0.lerpDouble(
        0.9, 0.2, (_switchBtnPostionY - 450.0) / (560.0 - 450.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _get_black_to_yellow_Color(),
      body: Stack(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: FlatButton(
              onPressed: () {},
              child: Icon(Icons.arrow_back_ios,
                  color: _get_white_to_black_Color()),
            ),
          ),
          //left text
          Padding(
              padding: EdgeInsets.only(left: 20, bottom: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Bedroom",
                      style: TextStyle(
                          color: _get_white_to_black_Color(),
                          fontSize: 40,
                          fontWeight: FontWeight.w700)),
                  Text("74º",
                      style: TextStyle(
                          color: _get_white_to_black_Color(),
                          fontSize: 25,
                          fontWeight: FontWeight.w800))
                ],
              )),

          Positioned(
              right: 20,
              bottom: 300,
              child: Container(
                height: 150,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(_get_opacity()), //yellor=0.2, black=0.9
                    borderRadius: BorderRadius.circular(20)),
              )),
          //white line
          Positioned(
              top: 0,
              right: 37,
              child: Container(
                  width: 4,
                  height: 450 + (_switchBtnPostionY - 450.0),
                  color: Colors.white)),
          // switch btn
          Positioned(
              top: _switchBtnPostionY, //450-560
              right: 25,
              child: GestureDetector(
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  _switchBtnPostionY += details.delta.dy;
                  _switchBtnPostionY = _switchBtnPostionY.clamp(450.0, 560.0);
                  print(_switchBtnPostionY);
                  setState(() {});
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
