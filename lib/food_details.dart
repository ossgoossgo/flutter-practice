import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<FoodDetails> {
  GlobalKey _itemKey1 = GlobalKey();
  GlobalKey _itemKey2 = GlobalKey();
  GlobalKey _itemKey3 = GlobalKey();
  var _isLike = false;
  var _blackBtnPositionX = 80.0 - 24;
  var _currentSelected = 1;

  _btnPressed(idx) {
    _currentSelected = idx;

    GlobalKey globalKey;
    switch (idx) {
      case 1:
        globalKey = _itemKey1;
        break;

      case 2:
        globalKey = _itemKey2;
        break;

      case 3:
        globalKey = _itemKey3;
        break;
      default:
    }

    final RenderBox containerRenderBox =
        globalKey.currentContext.findRenderObject();
    final containerPosition = containerRenderBox.localToGlobal(Offset.zero);

    final containerSize = containerRenderBox.size;

    _blackBtnPositionX = containerPosition.dx -
        ((100 - containerSize.width) / 2); //100 = black btn width
    setState(() {});
    print(containerPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 252, 222, 3),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 106, 94, 92),
                          size: 18,
                        ))),
                Text(
                  "Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 72, 61, 11)),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Container(
                          width: 5,
                          height: 25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 72, 61, 11),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 72, 61, 11),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 72, 61, 11),
                                    shape: BoxShape.circle),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
      body: Container(
        color: Color.fromARGB(255, 252, 222, 3),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Saltado",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700)),
                                  RawMaterialButton(
                                      constraints: BoxConstraints(
                                          minWidth: 36, minHeight: 36),
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        _isLike = !_isLike;
                                        setState(() {});
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.solidHeart,
                                        color:
                                            _isLike ? Colors.red : Colors.grey,
                                      )),
                                ],
                              ),
                              Text(
                                "Sauteed meat with vegetables",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: Image.asset("assets/images/steak.png",
                            fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                AnimatedPositioned(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                  left: _blackBtnPositionX,
                                  top: 50,
                                  child: Container(
                                    height: 45,
                                    width: 100,
                                    decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: StadiumBorder()),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 80, right: 80, top: 50),
                                    child: Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        RawMaterialButton(
                                            key: _itemKey1,
                                            constraints: BoxConstraints(
                                                minWidth: 36, minHeight: 36),
                                            onPressed: () {
                                              _btnPressed(1);
                                            },
                                            child: Text("Small",
                                                style: TextStyle(
                                                    color: _currentSelected == 1
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                        RawMaterialButton(
                                            key: _itemKey2,
                                            constraints: BoxConstraints(
                                                minWidth: 36, minHeight: 36),
                                            onPressed: () {
                                              _btnPressed(2);
                                            },
                                            child: Text("Medium",
                                                style: TextStyle(
                                                    color: _currentSelected == 2
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                        RawMaterialButton(
                                            key: _itemKey3,
                                            constraints: BoxConstraints(
                                                minWidth: 36, minHeight: 36),
                                            onPressed: () {
                                              _btnPressed(3);
                                            },
                                            child: Text("Big",
                                                style: TextStyle(
                                                    color: _currentSelected == 3
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ))),
                              ],
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 40, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Now",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                          Text("\$4.50",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 250, 222, 12)))
                                        ],
                                      )),
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Before",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white)),
                                              Text("\$9.00",
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Colors.grey.shade400))
                                            ],
                                          ))),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Center(
                                          child: SizedBox(
                                              width: 110,
                                              height: 50,
                                              child: Material(
                                                  color: Color.fromARGB(
                                                      255, 250, 222, 12),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: InkWell(
                                                      onTap: () {},
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      child: Container(
                                                          child: Center(
                                                              child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 120,
                                                        height: 50,
                                                        child: Text("Buy",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ))))))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SafeArea(
                                child: Container(
                                    child: Text("50% Dsnt.",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w700))))
                          ],
                        )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
