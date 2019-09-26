import 'dart:ui' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class P007 extends StatefulWidget {
  P007({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<P007> {
  var _scrollViewOffsetY = 0.0;
  double get _imageHeight {
    if (_scrollViewOffsetY < 0) {
      return 450.0 + _scrollViewOffsetY.abs();
    }
    return 450.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: _imageHeight + 20,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                        "https://image.freepik.com/free-photo/travel-concept-close-up-portrait-young-beautiful-attractive-redhair-girl-wtih-trendy-hat-sunglass-smiling-blue-pastel-background-copy-space_1258-852.jpg"))),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                print(notification.metrics.pixels);
                _scrollViewOffsetY = notification.metrics.pixels;
                setState(() {});
              },
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 450),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: MediaQuery.of(context).size.height - 450,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Meters Bonwe Printed\nShort sleeved T-shirt",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "X",
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Colour",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade500),
                                  )),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 4),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      FontAwesomeIcons.check,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            shape: BoxShape.circle),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 107, 163, 246),
                                            shape: BoxShape.circle),
                                      ))
                                ],
                              )
                            ],
                          )),
                    );
                  })),
        ),
        SafeArea(
            child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: Icon(FontAwesomeIcons.chevronLeft,
                    color: Colors.white.withOpacity(0.5), size: 18),
              ),
            ),
            Spacer(),
            RawMaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              onPressed: () {},
              constraints: BoxConstraints(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: Icon(FontAwesomeIcons.shoppingCart,
                    color: Colors.white.withOpacity(0.6), size: 18),
              ),
            ),
            RawMaterialButton(
              padding: EdgeInsets.only(left: 10, right: 30),
              onPressed: () {},
              constraints: BoxConstraints(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: Icon(FontAwesomeIcons.home,
                    color: Colors.white.withOpacity(0.6), size: 18),
              ),
            )
          ],
        )),
      ],
    ));
  }
}
