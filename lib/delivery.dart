import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Delivery extends StatefulWidget {
  Delivery({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<Delivery> {
  var _deliveryTo = "001";
  var _currentSelectItem = 0;

  DropdownButton _dropdownMenu() => DropdownButton<String>(
        underline: Container(
          height: 1.0,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 0.0))),
        ),
        iconSize: 15,
        icon: SizedBox(
          child: Icon(
            FontAwesomeIcons.chevronDown,
            color: Colors.grey.shade800,
          ),
        ),
        items: [
          DropdownMenuItem<String>(
            value: "001",
            child: Container(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Delivery to",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade400,
                          letterSpacing: 1)),
                  Text("Ring road 5/18",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                ],
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: "002",
            child: Container(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Delivery to",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          letterSpacing: 1)),
                  Text("Ring road 5/19",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                ],
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: "003",
            child: Container(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Delivery to",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          letterSpacing: 1)),
                  Text("Ring road 5/20",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                ],
              ),
            ),
          )
        ],
        onChanged: (value) {
          setState(() {
            _deliveryTo = value;
          });
        },
        value: _deliveryTo,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          //navigation
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 80,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Container(
                    height: 50,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 155, 181, 74),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset("assets/images/listBtn.png"),
                            ))),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20), child: _dropdownMenu())
              ],
            ),
          ),
          //search
          Container(
            margin: EdgeInsets.only(left: 30, top: 10),
            height: 60,
            width: 300,
            child: TextField(
                decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 20),
              hintText: "e.x. Chichen, Pasta...",
              labelStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(FontAwesomeIcons.search, color: Colors.black),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            )),
          ),
          //special offers
          Container(
              margin: EdgeInsets.only(left: 30, top: 20),
              height: 30,
              child: Text("Special offers",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade800))),
          //listview
          Expanded(
            flex: 6,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemExtent: 150.0,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _currentSelectItem = index;
                      setState(() {});
                    },
                    child: _buildItem(index),
                  );
                }),
          ),
          //popular restaurants title
          Container(
              margin: EdgeInsets.only(left: 30, top: 0),
              height: 30,
              child: Text("Popular Restaurants",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade800))),
          //popular restaurants photo
          Expanded(
            flex: 4,
            child: Center(
                child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://image.freepik.com/free-photo/som-tam-thai-thai-papaya-salad-wooden-background_1150-14653.jpg")),
              ),
            )),
          ),
        ]),
      ),
    );
  }

  _buildItem(idx) {
    return Container(
      child: Center(
          child: Container(
        decoration: idx == _currentSelectItem
            ? BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(80, 156, 181, 70),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                    spreadRadius: 10)
              ], color: Colors.red, borderRadius: BorderRadius.circular(60))
            : null,
        width: 120,
        height: 280,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.none,
                        image: ExactAssetImage("assets/images/salad2.png",
                            scale: 2)),
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 15, bottom: 10),
                        child: Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.white.withOpacity(0.8),
                          size: 20,
                        ))),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                  padding: EdgeInsets.only(left: 13, top: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 155, 181, 72),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text("Salad",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withOpacity(0.8))),
                      SizedBox(
                        height: 5,
                      ),
                      Text("New American",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withOpacity(0.4))),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidStar,
                              size: 13, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text("4.8",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white.withOpacity(0.8))),
                          SizedBox(
                            width: 5,
                          ),
                          Text("(127)",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white.withOpacity(0.4)))
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      )),
    );
  }
}
