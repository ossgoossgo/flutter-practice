import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import "package:intl/intl.dart";
import 'package:intl/intl.dart' as prefix0;

class MiniCarPage extends StatefulWidget {
  MiniCarPage({Key key}) : super(key: key);

  _MiniCarPageState createState() => _MiniCarPageState();
}

class _MiniCarPageState extends State<MiniCarPage> {
  List<MiniCarInfo> _miniCarInfoList;

  PageController _pageController;
  double _pageControllerPage = 0.0;

  @override
  void initState() {
    super.initState();
    //change status bar text color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith());

    _pageController = PageController(viewportFraction: 0.75);

    _miniCarInfoList = [];
    _miniCarInfoList.add(MiniCarInfo(
      name: "MINI COUNTRYMAN",
      imagePath: "assets/images/miniRed.png",
      price: 26100,
      topSpeed: 128,
      power: 181,
      passenger: 4,
      bgColorTop: Color.fromARGB(235, 239, 127, 84),
      bgColorBottom: Color.fromARGB(235, 209, 62, 51),
    ));

    _miniCarInfoList.add(MiniCarInfo(
      name: "MINI COUNTRYMAN 2",
      imagePath: "assets/images/miniBlue.png",
      price: 24100,
      topSpeed: 228,
      power: 189,
      passenger: 4,
      bgColorTop: Color.fromARGB(235, 34, 212, 229),
      bgColorBottom: Color.fromARGB(235, 38, 114, 188),
    ));

    _miniCarInfoList.add(MiniCarInfo(
      name: "MINI COUNTRYMAN 3",
      imagePath: "assets/images/miniYellow.png",
      price: 29100,
      topSpeed: 143,
      power: 189,
      passenger: 4,
      bgColorTop: Color.fromARGB(235, 254, 202, 16),
      bgColorBottom: Color.fromARGB(235, 227, 132, 12),
    ));
  }

  _getScale(int idx) {
    //print("idx:${idx}, pagecontrollerPage=${_pageControllerPage}");
    double scale = 1 - (_pageControllerPage - idx).abs() * 0.2;
    return scale < 0.9 ? 0.9 : scale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/miniCarGreyBG.png',
                  fit: BoxFit.fill,
                ),
              )),
          _buildBackgroundColor(),
          Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification onNotification) {
                  setState(() {
                    _pageControllerPage = _pageController.page;
                    //print(_pageControllerPage);
                  });
                },
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: _miniCarInfoList.length,
                    itemBuilder: (context, idx) {
                      return Container(
                        child: Center(
                            child: Transform.scale(
                                scale: _getScale(idx),
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 380.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 30),
                                                  child: Text(
                                                      _miniCarInfoList[idx]
                                                          .name,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.grey
                                                              .shade700)))),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 70),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade400)),
                                              child: Text(
                                                  "\$${_formatNumber(_miniCarInfoList[idx].price)}",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                          ),
                                          Transform.scale(
                                            scale: 1.15,
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Transform.translate(
                                                  offset: Offset(-6, 60),
                                                  child: Container(
                                                      child: Image.asset(
                                                    _miniCarInfoList[idx]
                                                        .imagePath,
                                                    fit: BoxFit.contain,
                                                  )),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //see details btn
                                    Positioned(
                                      bottom: -25,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Center(
                                            child: Container(
                                          decoration: ShapeDecoration(
                                            shape: StadiumBorder(),
                                            color: _miniCarInfoList[idx]
                                                .bgColorTop,
                                          ),
                                          width: 160,
                                          height: 50,
                                          child: Center(
                                              child: Text("SEE DETAILS",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                        )),
                                      ),
                                    )
                                  ],
                                ))),
                      );
                    }),
              )),
              Container(
                color: Colors.white,
                height: 150,
              ),
            ],
          ),
          _buildNavigationBar(),
          _buildBottomTabBar(),
        ],
      ),
    );
  }

  _formatNumber(int aNum) {
    var format = prefix0.NumberFormat("##,###");
    return format.format(aNum);
  }

  _buildBottomTabBar() {

    int idx = _pageControllerPage.toInt();
    MiniCarInfo miniCarInfo = _miniCarInfoList[idx];

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
          height: 150,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 30,
                offset: Offset(0, -10))
          ]),
          child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 100,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.tachometerAlt,
                                color: Colors.grey.shade700,
                                size: 30,
                              ),
                              Text(miniCarInfo.topSpeed.toString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700)),
                              Text("Top Speed(MPH)",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey))
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.car,
                                color: Colors.grey.shade700,
                                size: 30,
                              ),
                              Text(miniCarInfo.power.toString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700)),
                              Text("Power(HP)",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey))
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.users,
                                color: Colors.grey.shade700,
                                size: 30,
                              ),
                              Text(miniCarInfo.passenger.toString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700)),
                              Text("Passenger",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey))
                            ],
                          ),
                        ),
                      ],
                    )),
              ))),
    );
  }

  _buildBackgroundColor() {
    Color colorTop;
    Color colorBottom;
    int currentIndx = _pageControllerPage.toInt();
    if (currentIndx + 1 < _miniCarInfoList.length) {
      Color currentTopColor = _miniCarInfoList[currentIndx].bgColorTop;
      Color currentBottomColor = _miniCarInfoList[currentIndx].bgColorBottom;

      Color nextTopColor = _miniCarInfoList[currentIndx + 1].bgColorTop;
      Color nextBottomColor = _miniCarInfoList[currentIndx + 1].bgColorBottom;

      colorTop = Color.lerp(currentTopColor, nextTopColor,
          _pageControllerPage - _pageControllerPage.toInt());
      colorBottom = Color.lerp(currentBottomColor, nextBottomColor,
          _pageControllerPage - _pageControllerPage.toInt());
    } else {
      //last item
      colorBottom = _miniCarInfoList.last.bgColorBottom;
      colorTop = _miniCarInfoList.last.bgColorTop;
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            colorBottom, colorTop
            // Color.fromARGB(255, 213, 50, 49),
            // Color.fromARGB(255, 239, 127, 84),
          ])),
    );
  }

  _buildNavigationBar() {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            )),
        Text("MINI",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            )),
      ],
    ));
  }
}

class MiniCarInfo {
  String name;
  String imagePath;
  int price;
  int topSpeed;
  int power;
  int passenger;
  Color bgColorTop;
  Color bgColorBottom;

  MiniCarInfo(
      {this.name,
      this.imagePath,
      this.price,
      this.topSpeed,
      this.power,
      this.passenger,
      this.bgColorTop,
      this.bgColorBottom});
}