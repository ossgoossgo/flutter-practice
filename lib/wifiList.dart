import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_drawing/path_drawing.dart';
import 'dart:math';

class WifiList extends StatefulWidget {
  WifiList({Key key}) : super(key: key);

  _WifiListState createState() => _WifiListState();
}

class _WifiListState extends State<WifiList> {

  List<WifiInfo> _wifiInfoList;
  final _listViewKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();

    _wifiInfoList = [
      // WifiInfo("bxm-miniprogram-5G", 2),
      // WifiInfo("Osteria Francescana", 219313)
    ];
  }

  _insertItem() {
    int num = Random().nextInt(100);

    _wifiInfoList.insert(
      0,
      WifiInfo("OOOOOOOO-5G-${_wifiInfoList.length + 1}", num),
    );
    _listViewKey.currentState.insertItem(1);
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 224, 231),
      body: Column(
        children: <Widget>[
          //top navigation bar
          SafeArea(
              bottom: false,
              child: Container(
                  color: Colors.transparent,
                  height: 66,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                              onPressed: () {},
                              child: Text("back",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 75, 77, 89),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)))),
                      Align(
                          alignment: Alignment.center,
                          child: Text("WiFi",
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 56, 57, 71),
                                  fontWeight: FontWeight.w700)))
                    ],
                  ))),
          //ListView
          Expanded(
            child: Container(
              child: AnimatedList(
                  key: _listViewKey,
                  initialItemCount: _wifiInfoList.length+1,
                  itemBuilder: (context, index, animation) {
                    if (index == 0) {
                      return FlatButton(
                        onPressed: () {
                          print('add one cell');
                          _insertItem();
                        },
                        child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 30,
                            color: Colors.transparent,
                            child: CustomPaint(
                              painter: RectPainter(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.plus,
                                      size: 30, color: Colors.grey),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Create my QR code",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            )),
                      );
                    }
                    return ListItem(index, animation);
                  }),

              //ListView without animation
              /*
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: _wifiInfoList.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return FlatButton(
                        onPressed: () {
                          print('add one cell');
                          _insertItem();
                        },
                        child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 30,
                            color: Colors.transparent,
                            child: CustomPaint(
                              painter: RectPainter(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.plus,
                                      size: 30, color: Colors.grey),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Create my QR code",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            )),
                      );
                    }
                    return ListItem(index);
                  }),
                  */
            ),
          )
        ],
      ),
    );
  }

  Tween<Offset> tween = Tween<Offset>(
    begin: Offset(1, 0),
    end: Offset(0, 0),
  );

  Widget ListItem(idx, animation) => SlideTransition(
        position: animation.drive(tween),
        child: Container(
          height: 180,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: <Widget>[
                //left side
                Expanded(
                  flex: 6,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Transform.translate(
                              offset: Offset(-10, 0),
                              child: Switch(
                                activeColor: Colors.grey.shade200,
                                activeTrackColor: Colors.grey.shade300,
                                value: true,
                                onChanged: (value) {},
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text("WiFi",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 2,
                          ),
                          Text(_wifiInfoList[idx - 1].name,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Connected",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(_wifiInfoList[idx - 1].connected.toString(),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w700))
                        ],
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                      child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    margin: EdgeInsets.only(
                        left: 0, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              Icon(
                                FontAwesomeIcons.wifi,
                                color: Color.fromARGB(255, 102, 112, 156),
                                size: 14,
                              ),
                              Text("Free WiFi",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(height: 5),
                              QrImage(
                                  data: "1234567890",
                                  version: QrVersions.auto,
                                  size: 80.0,
                                  foregroundColor: Colors.grey.shade700),
                              Text(
                                "xxxxxxxxxxxx 5g",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade500),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 58, 90, 181),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              )),
                        )
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      );
}

class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(20, 20, size.width - 40, size.height - 40),
          Radius.circular(15.0)));

    //canvas.drawPath(path, paint);

    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(RectPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(RectPainter oldDelegate) => false;
}

class WifiInfo {
  String name;
  int connected;
  WifiInfo(this.name, this.connected);
}

