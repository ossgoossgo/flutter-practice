import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class P006 extends StatefulWidget {
  P006({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<P006> {
  double _scrollOffset = 0;

  double _getSigmaValue() {
    double value = (_scrollOffset / 400) * 20;
    return value.clamp(0.0, 20.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/eggBenedict.png")),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: ClipRect(
                  child: BackdropFilter(
                filter: prefix0.ImageFilter.blur(
                    sigmaX: _getSigmaValue(), sigmaY: _getSigmaValue()),
                child: Container(
                  color: Colors.white10,
                ),
              )),
            ),
          ),
          Container(
              child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    _scrollOffset = notification.metrics.pixels;
                    setState(() {});
                    //print(_scrollOffset);
                  },
                  child: ListView.separated(
                      padding: EdgeInsets.only(top: 400),
                      separatorBuilder: (context, idx) => Container(
                            color: Colors.white,
                            child: Divider(
                              height: 2,
                              color: Colors.grey[350],
                            ),
                          ),
                      itemCount: 6,
                      itemBuilder: (context, idx) {
                        switch (idx) {
                          case 0:
                            return _buildItemA();
                            break;

                          case 1:
                            return _buildItemB();
                            break;

                          default:
                            return Container(
                                height: 250,
                                child: Container(
                                  color: Colors.white,
                                  child: Placeholder(),
                                ));
                        }
                      })))
        ],
      ),
    );
  }
}

_buildItemA() => Container(
      color: Colors.white,
      height: 130,
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Egg Benedict",
                        style: TextStyle(
                            color: Color.fromARGB(255, 163, 158, 137),
                            fontSize: 26,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Master the king of breakfast dishes",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Column(
                  children: <Widget>[
                    Text(
                      "6.2k",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Cooked",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(FontAwesomeIcons.solidStar,
                          color: Colors.grey.shade400, size: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(FontAwesomeIcons.solidStar,
                          color: Colors.grey.shade400, size: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(FontAwesomeIcons.solidStar,
                          color: Colors.grey.shade400, size: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(FontAwesomeIcons.solidStar,
                          color: Colors.grey.shade400, size: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(FontAwesomeIcons.solidStar,
                          color: Colors.grey.shade200, size: 12),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text("(288 Reviews)",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)))
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                height: 20,
                width: 90,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("Add to Fav",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 10,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              )
            ],
          )),
    );

_buildItemB() => Container(
      color: Colors.white,
      height: 200,
      child: Padding(
          padding: EdgeInsets.only(left: 20, right: 60, top: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Servings",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "2pp",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Prep Time",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "25m",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Cook Time",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "20m",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The classic pile-up of toasted English muffins topped with seared Canadian bacon, poached eggs and creamy hollandaise sauce you usually reserve for weekend brunch plans.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          )),
    );
