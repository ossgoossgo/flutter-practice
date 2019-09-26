import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Starbucks extends StatefulWidget {
  Starbucks({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<Starbucks> {
  double _scrollOffsetY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0 - _scrollOffsetY * 0.2,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                height: 400,
                child: Image.asset("assets/images/starbucksBG3.png"),
              )),
          Positioned(
              top: 0 - _scrollOffsetY * 0.5,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                height: 400,
                child: Image.asset("assets/images/starbucksBG2.png"),
              )),
          Positioned(
              top: 0 - _scrollOffsetY,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                height: 400,
                child: Image.asset("assets/images/starbucksBG1.png"),
              )),
          NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _scrollOffsetY = notification.metrics.pixels;
                setState(() {});
              },
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 400),
                  itemCount: 5,
                  itemExtent: 200.0,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0 //first cell
                        ? _buildOverflowBox()
                        : Container(
                            color: Colors.white,
                            child: Placeholder(),
                          );
                  })),
          SafeArea(
              child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text("STARBUCKS",
                style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 45, 44, 67),
                    fontWeight: FontWeight.w900)),
          )),
        ],
      ),
    );
  }

  _buildOverflowBox() => Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width, color: Colors.white),
            OverflowBox(
              alignment: Alignment.topLeft,
              child: Transform.translate(
                offset: Offset(0.0, -40),
                child: _cardBalance(),
              ),
            )
          ],
        ),
      );

  _cardBalance() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            color: Colors.white,
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Text("Card Balance",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade700)),
                          Spacer(),
                          Text("\$",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade700)),
                          Text("194.20",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade700))
                        ],
                      )),
                  Divider(),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.wallet,
                                color: Colors.grey.shade700),
                            SizedBox(height: 10),
                            Text("Reload",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.mobile,
                                color: Colors.grey.shade700),
                            SizedBox(height: 10),
                            Text("Pay",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.fileInvoiceDollar,
                                color: Colors.grey.shade700),
                            SizedBox(height: 10),
                            Text("Rewards",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      );
}
