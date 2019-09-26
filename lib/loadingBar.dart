import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class LoadingBar extends StatefulWidget {
  LoadingBar({Key key}) : super(key: key);

  _LoadingBarState createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  double _loadBarHeight = 20; //3
  int _process = 0;
  bool _isFetchData = false;
  double _listviewPaddingTop = 0.0;

  List<ListItemData> _listviewData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //background color
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromARGB(255, 248, 217, 75),
                  Color.fromARGB(255, 247, 203, 2),
                ])),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text("CUBBYGRAHAM",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 25,
                            )),
                      ],
                    )),
                //Listview
                Expanded(
                    child: NotificationListener<ScrollNotification>(
                  onNotification: (notifiction) {
                    print(notifiction.metrics.pixels);
                    if (notifiction.metrics.pixels < -100) {
                      _fetchData();
                    }

                    if (_isFetchData &&
                        notifiction.metrics.pixels < _loadBarHeight) {
                      //if scrolling, when touch end and scrolling back, add listview padding height
                      _listviewPaddingTop = _loadBarHeight;
                      setState(() {});
                    }
                  },
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: _listviewPaddingTop),
                      itemCount: _listviewData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            //background white color
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 248, 150, 75),
                                      blurRadius: 10,
                                      offset: Offset(5, 10))
                                ],
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 0),
                              height: 140,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, right: 30, top: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(_listviewData[index].name,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(_listviewData[index].content,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //image
                            Container(
                                height: 160,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 28, bottom: 20),
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              blurRadius: 10,
                                              offset: Offset(5, 10))
                                        ],
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                _listviewData[index].imageURL)),
                                      ),
                                    ))),
                          ],
                        );
                      }),
                )),
              ],
            ),
          ),
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 48),
            width: () {
              return MediaQuery.of(context).size.width * _process / 100.0;
            }(),
            height: _loadBarHeight,
            color: Colors.red,
          ))
        ],
      ),
    );
  }

  void _fetchData() {
    if (_isFetchData) return;
    _isFetchData = true;

    setState(() {
      _process = 0;
    });

    Timer countDownTimer;
    countDownTimer = Timer.periodic(Duration(milliseconds: 10), (t) {
      setState(() {
        //print(t.tick);
        _process = countDownTimer.tick;

        if (_process > 100) {
          _process = 0;
          countDownTimer.cancel();

          _listviewData.add(
            ListItemData(
                name: "HELLO",
                //imageURL: "https://picsum.photos/id/201/200/200",
                imageURL:
                    "https://picsum.photos/id/${200 + _listviewData.length}/200/200",
                content:
                    "Hello 2018,I'm curious of what you got planned for me..."),
          );
          _listviewPaddingTop = 0.0;
          _isFetchData = false;
        }
      });
    });
  }
}

class ListItemData {
  String imageURL;
  String name;
  String content;
  ListItemData({this.imageURL, this.name, this.content});
}
