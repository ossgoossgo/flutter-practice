import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class CactusPage extends StatefulWidget {
  CactusPage({Key key}) : super(key: key);

  _CactusPageState createState() => _CactusPageState();
}

class _CactusPageState extends State<CactusPage> {
  List<Cactus> _cactusList = [];

  void addCactus() {
    _cactusList.add(Cactus(
      rotateAngle: -10.0 + getRandrom(0, 30),
      offset: Offset(-30 + getRandrom(0, 60), 0),
      size: Size(getRandrom(50, 180), getRandrom(40, 300)),
    ));
    setState(() {});
  }

  double getRandrom(min, max) {
    if (min == 0 && max == 0) return 0;
    return min + (Random().nextInt(max - min)).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 250, 253),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back_ios, color: Colors.grey.shade400),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.grey.shade400),
                    ],
                  ))),
          Positioned(
              top: 640,
              child: Text("Barrel Cactus",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 79, 99, 129),
                      fontWeight: FontWeight.w700))),
          //top navigation bar
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 35,
                          height: 35,
                          child: Image.asset("assets/images/cactusBtn.png"),
                        ),
                      ),
                      Spacer(),
                      FlatButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.search,
                              color: Colors.grey.shade500))
                    ],
                  ))),
          //Bottom navigation bar
          SafeArea(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 50, left: 10, right: 10),
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Transform.translate(
                                  offset: Offset(0, -30),
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    child: Icon(FontAwesomeIcons.reply,
                                        color:
                                            Color.fromARGB(255, 17, 221, 142)),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Transform.translate(
                                offset: Offset(-5, -10),
                                child: Container(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    child: Icon(FontAwesomeIcons.camera,
                                        color:
                                            Color.fromARGB(255, 17, 221, 142)),
                                  ),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              width: 80,
                              height: 80,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  _cactusList = [];
                                  setState(() {});
                                },
                                child: Icon(
                                  FontAwesomeIcons.times,
                                  color: Colors.grey.shade300,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Transform.translate(
                                offset: Offset(5, -10),
                                child: Container(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      addCactus();
                                    },
                                    child: Icon(FontAwesomeIcons.shower,
                                        color:
                                            Color.fromARGB(255, 17, 221, 142)),
                                  ),
                                )),
                          ),
                          Expanded(
                            child: Transform.translate(
                                offset: Offset(0, -30),
                                child: Container(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    child: Icon(FontAwesomeIcons.braille,
                                        color:
                                            Color.fromARGB(255, 17, 221, 142)),
                                  ),
                                )),
                          )
                        ],
                      )))),
          Positioned(
              top: 140,
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Positioned(
                        top: 220,
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Image.asset("assets/images/pot1.png"),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: _cactusList),
                    ),
                    Positioned(
                        top: 220,
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Image.asset("assets/images/pot2.png"),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Cactus extends StatefulWidget {
  final double rotateAngle;
  final Offset offset;
  final Size size;

  Cactus({Key key, this.rotateAngle, this.offset, this.size}) : super(key: key);

  _CactusState createState() => _CactusState();
}

class _CactusState extends State<Cactus> with SingleTickerProviderStateMixin {
  AnimationController animationCtr;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationCtr = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    CurvedAnimation curve =
        CurvedAnimation(parent: animationCtr, curve: Curves.elasticOut);
    animation = Tween(begin: 0.0, end: widget.size.height).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationCtr.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: widget.offset, //-30~30
        child: Transform.rotate(
            angle: pi / 180 * widget.rotateAngle, //-15~15
            child: Container(
              //w100-500 h60-400
              width: widget.size.width,
              height: animation.value,
              child: Image.asset("assets/images/cactus.png", fit: BoxFit.fill),
            )));
  }
}
