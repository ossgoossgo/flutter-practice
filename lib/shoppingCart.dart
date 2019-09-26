import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key key}) : super(key: key);

  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  double _btnPositionX = 20.0;

  double _getFriutOpacity() {
    return ((_btnPositionX - 20.0) / (300.0 - 20.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          constraints: BoxConstraints.expand(),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              //top navigation
              SafeArea(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: Color.fromARGB(255, 106, 94, 92),
                                size: 40,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_basket,
                                color: Color.fromARGB(255, 106, 94, 92),
                                size: 40,
                              ))
                        ],
                      ))),
              Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 350,
                    height: 350,
                    child: Image.asset(
                      "assets/images/papaya1.png",
                      fit: BoxFit.contain,
                    ),
                  )),
              Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Opacity(
                      opacity: _getFriutOpacity(),
                      child: Container(
                        width: 350,
                        height: 350,
                        child: Image.asset(
                          "assets/images/papaya2.png",
                          fit: BoxFit.contain,
                        ),
                      ))),
              Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromARGB(255, 163, 202, 127)),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 45,
                          height: 8,
                          decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.4),
                              shape: StadiumBorder()),
                        ),
                        //name
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text("Papaya Golden",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                        //price
                        Padding(
                            padding: EdgeInsets.only(top: 82),
                            child: Text("\$5.99",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                        //Add to Basket Btn
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 25),
                              child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 90, vertical: 25),
                                  color: Color.fromARGB(255, 124, 154, 95),
                                  shape: StadiumBorder(),
                                  onPressed: () {},
                                  child: Text("ADD TO BASKET",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)))),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                margin: EdgeInsets.only(bottom: 30),
                                child: Row(
                                  children: <Widget>[
                                    Text("GREEN",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 118, 174, 65),
                                            fontWeight: FontWeight.w700)),
                                    Spacer(),
                                    Text("RIPE",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 213, 230, 84),
                                            fontWeight: FontWeight.w700))
                                  ],
                                ))),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 10,
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                decoration: ShapeDecoration(
                                    shape: StadiumBorder(),
                                    color: Colors.white.withOpacity(0.3)))),
                        Positioned(
                            top: 160,
                            left: _btnPositionX, //20-300
                            child: GestureDetector(
                                onHorizontalDragUpdate: (dragUpdateDetails) {
                                  _btnPositionX += dragUpdateDetails.delta.dx;
                                  _btnPositionX =
                                      _btnPositionX.clamp(20.0, 300.0);
                                  setState(() {});
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: <Widget>[
                                      Container(
                                        width: 46,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 163, 202, 127)),
                                      ),
                                      Container(
                                        width: 32,
                                        height: 50,
                                        decoration: ShapeDecoration(
                                            shape: StadiumBorder(),
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )))
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
