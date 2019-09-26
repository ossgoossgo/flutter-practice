import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';

class CoffeeOder extends StatefulWidget {
  CoffeeOder({Key key}) : super(key: key);

  _State createState() => _State();
}

class Item {
  final Image image;
  final String itemName;
  int number = 0;
  Item(this.image, this.itemName);
}

class _State extends State<CoffeeOder> {
//Icon made by Freepik from www.flaticon.com
  List<Item> _coffeList = [
    Item(Image.asset("assets/images/coffee1.png"), "Americano"),
    Item(Image.asset("assets/images/coffee1.png"), "Espresso Con Panna"),
    Item(Image.asset("assets/images/coffee1.png"), "Macchiato"),
    Item(Image.asset("assets/images/coffee1.png"), "Cappuccino"),
    Item(Image.asset("assets/images/coffee1.png"), "Iced Coffee"),
    Item(Image.asset("assets/images/coffee1.png"), "Iced Coffee"),
    Item(Image.asset("assets/images/coffee1.png"), "Iced Coffee"),
  ];

  @override
  void initState() {
    super.initState();
  }

  int _getTotalNum() {
    var totalNum = 0;
    for (var item in _coffeList) {
      totalNum += item.number;
    }
    return totalNum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 244, 243, 240),
        title: Text(
          "DOLCHEZZA",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Color.fromARGB(255, 106, 94, 92)),
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 106, 94, 92),
          ),
        ),
        actions: <Widget>[
          IconButton(
                onPressed: () {},
                icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 106, 94, 92)),
                    ),
                    child: Icon(
                      FontAwesomeIcons.exclamation,
                      color: Color.fromARGB(255, 106, 94, 92),
                      size: 10,
                    )))
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 244, 243, 240),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                  itemCount: _coffeList.length,
                  separatorBuilder: (context, idx) {
                    return Divider(
                      indent: 60,
                      endIndent: 60,
                      height: 2,
                      color: Colors.grey.shade400,
                    );
                  },
                  itemBuilder: (context, idx) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      height: 120,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                              height: 60,
                              width: 60,
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    child: Icon(FontAwesomeIcons.minus),
                                    onTap: () {
                                      _coffeList[idx].number -= 1;
                                      if (_coffeList[idx].number <= 0) {
                                        _coffeList[idx].number = 0;
                                      }
                                      setState(() {});
                                    },
                                  ))),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              SizedBox(
                                  width: 200,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: _coffeList[idx].image,
                                      ),
                                      Positioned(
                                          left: 70,
                                          top: 0,
                                          child: Container(
                                            constraints: BoxConstraints(
                                                minHeight: 30, minWidth: 30),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                            decoration: ShapeDecoration(
                                                color: Color.fromARGB(
                                                    255, 255, 153, 153),
                                                shape: StadiumBorder()),
                                            child: Center(
                                                child: Text(
                                              _coffeList[idx].number.toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800),
                                            )),
                                          ))
                                    ],
                                  )),
                              SizedBox(height: 5),
                              Text(_coffeList[idx].itemName)
                            ],
                          ),
                          SizedBox(
                              height: 60,
                              width: 60,
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    child: Icon(FontAwesomeIcons.plus),
                                    onTap: () {
                                      _coffeList[idx].number += 1;
                                      setState(() {});
                                    },
                                  ))),
                        ],
                      ),
                    );
                  }),
            ),
            SafeArea(
                child: Container(
              color: Color.fromARGB(255, 248, 228, 116),
              height: 60,
              width: double.infinity,
              child: Center(
                  child: Text("Check Out (${_getTotalNum()})",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 106, 94, 92)))),
            ))
          ],
        ),
      ),
    );
  }
}
