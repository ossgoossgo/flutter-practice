import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class Booking extends StatefulWidget {
  Booking({Key key}) : super(key: key);

  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<BookingItem> bookingItemList = [
    BookingItem(
        color1: Color.fromARGB(255, 205, 73, 121),
        color2: Color.fromARGB(255, 233, 71, 119),
        country: "France",
        city: "Paris"),
    BookingItem(
        color1: Color.fromARGB(255, 220, 99, 90),
        color2: Color.fromARGB(255, 248, 118, 83),
        country: "USA",
        city: "New York"),
    BookingItem(
        color1: Color.fromARGB(255, 53, 155, 151),
        color2: Color.fromARGB(255, 48, 184, 180),
        country: "England",
        city: "London"),
    BookingItem(
        color1: Color.fromARGB(255, 56, 147, 62),
        color2: Color.fromARGB(255, 65, 174, 69),
        country: "India",
        city: "Mumbai")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: _buildBottomNavigationBar,
      backgroundColor: Color.fromARGB(255, 58, 52, 64),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 60, bottom: 44),
                  itemCount: bookingItemList.length,
                  itemExtent: 210.0,
                  itemBuilder: (BuildContext context, int index) {
                    BookingItem bookingItem = bookingItemList[index];

                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          print(
                              'context h=${constraints.maxHeight}, w=${constraints.maxWidth}');

                          return Container(
                              decoration: BoxDecoration(
                                color: bookingItem.color2,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  // CustomPaint(
                                  //                 painter:
                                  //                     WavePainter(bookingItem.color1),
                                  //               )

                                  //1. Use Boxfit
                                  // ClipRRect(
                                  //     borderRadius: BorderRadius.only(
                                  //         topRight: Radius.circular(16),
                                  //         topLeft: Radius.circular(16)),
                                  //     child: Container(
                                  //         constraints: BoxConstraints.expand(),
                                  //         child: FittedBox(
                                  //             fit: BoxFit.fill,
                                  //             child: SizedBox(
                                  //                 height: 200,
                                  //                 width: 414.0,
                                  //                 child: CustomPaint(
                                  //                   painter: WavePainter(
                                  //                       bookingItem.color1),
                                  //                 ))))),

                                  //2. Mapping
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      child: Container(
                                          child: CustomPaint(
                                        size: Size(constraints.maxWidth,
                                            constraints.maxHeight),
                                        painter:
                                            WavePainter(bookingItem.color1),
                                      ))),

                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              height: 150,
                                              child: Image.asset(
                                                  "assets/images/tower.png"),
                                            )),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(bookingItem.country,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(bookingItem.city,
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w300))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ));
                        },
                      ),
                    );
                  })),
          SafeArea(
              child: Container(
                  color: Color.fromARGB(255, 58, 52, 64),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              width: 110,
                              child:
                                  Image.asset("assets/images/bookingLogo.png")),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Container(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    FontAwesomeIcons.slidersH,
                                    color: Colors.white,
                                    size: 30,
                                  )))
                        ],
                      )))),
          Positioned(
              left: 0, right: 0, bottom: 0, child: _buildBottomNavigationBar),
        ],
      ),
    );
  }

  Widget get _buildBottomNavigationBar {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        child: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 58, 52, 64),
            selectedItemColor: Color.fromARGB(255, 217, 74, 122),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.home,
                    size: 30,
                  ),
                  title: SizedBox(
                    width: 0,
                    height: 0,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.search,
                    size: 30,
                  ),
                  title: SizedBox(
                    width: 0,
                    height: 0,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.map,
                    size: 30,
                  ),
                  title: SizedBox(
                    width: 0,
                    height: 0,
                  )),
              BottomNavigationBarItem(
                  icon: Transform.rotate(
                      angle: -pi / 180.0 * 45,
                      child: Icon(
                        FontAwesomeIcons.plane,
                        size: 30,
                      )),
                  title: SizedBox(
                    width: 0,
                    height: 0,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.user,
                    size: 30,
                  ),
                  title: SizedBox(
                    width: 0,
                    height: 0,
                  )),
            ]));
  }
}

class WavePainter extends CustomPainter {
  Color fillColor;
  WavePainter(this.fillColor);

  double orig_w = 414.0;
  double orig_h = 170.0;

  double Mapping(double input, double num1, double num2) {
    return input / num1 * num2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size);

    double MappingX(double aNum) {
      return Mapping(aNum, orig_w, size.width);
    }

    double MappingY(double aNum) {
      return Mapping(aNum, orig_h, size.height);
    }

    Paint paint = Paint()..color = fillColor;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, MappingY(116))
      ..cubicTo(MappingX(92), MappingY(170), MappingX(108), MappingY(49),
          MappingX(178), MappingY(44)) //92=x, 170=y, 108 =x, 49=y....
      ..cubicTo(MappingX(248), MappingY(41), MappingX(258), MappingY(130),
          MappingX(325), MappingY(130))
      ..cubicTo(MappingX(359), MappingY(135), MappingX(402), MappingY(96),
          MappingX(413), MappingY(55))
      ..lineTo(MappingX(413), MappingY(0))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;
}

class BookingItem {
  Color color1;
  Color color2;
  String country;
  String city;
  BookingItem({this.color1, this.color2, this.country, this.city});
}
