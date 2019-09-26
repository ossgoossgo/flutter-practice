import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class ReloadTest extends StatefulWidget {
  ReloadTest({Key key}) : super(key: key);

  _ReloadTestState createState() => _ReloadTestState();
}

class _ReloadTestState extends State<ReloadTest> {
  int _process = 0;
  double _listviewPaddingTop = 10.0;
  bool isDownload = false;

  @override
  void initState() {
    super.initState();
    countdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            color: Colors.yellow,
          ),
          NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                //_scrollOffsetY = notification.metrics.pixels;
                print(notification.metrics.pixels);
                if (notification.metrics.pixels < -100.0) {
                  setState(() {
                    countdown();
                  });
                }

                if (isDownload && notification.metrics.pixels < 10.0) {
                  _listviewPaddingTop = 10;
                  setState(() {});
                }
              },
              child: ListView.builder(
                  padding: EdgeInsets.only(top: _listviewPaddingTop),
                  itemCount: 30,
                  itemExtent: 50.0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.blue,
                      child: ListTile(title: Text("title ")),
                    );
                  })),
          Container(
              width: () {
                //print(_process);
                return MediaQuery.of(context).size.width * _process / 100.0;
              }(),
              height: 10.0,
              color: Colors.purple),
        ],
      )),
    );
  }

  void countdown() {
    if (isDownload) return;
    isDownload = true;

    setState(() {
      _process = 0;
    });

    Timer countdownTimer;
    countdownTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        _process = countdownTimer.tick;

        if (countdownTimer.tick > 100) {
          isDownload = false;
          _listviewPaddingTop = 0.0;
          _process = 0;
          countdownTimer.cancel();
        }
      });
    });
  }
}
