import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "dart:ui" as ui;

class HotelBooking extends StatefulWidget {
  HotelBooking({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<HotelBooking> with TickerProviderStateMixin {
  var _isLike = false;
  var _isShowDetailInfo = false;
  AnimationController _arrow_animationController;
  Animation<double> _arrow_animation;
  @override
  void initState() {
    super.initState();
    _arrow_animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _arrow_animation =
        Tween<double>(begin: 0, end: 0.5).animate(_arrow_animationController);
  }

  @override
  void dispose() {
    _arrow_animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //background
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://image.freepik.com/free-photo/traditional-swiss-village-with-old-wooden-houses-alps_8353-6484.jpg")),
            ),
          ),
          //navigation
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {},
                          icon: Container(
                              width: 30,
                              height: 30,
                              child: Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Color.fromARGB(255, 106, 94, 92),
                                size: 20,
                              ))),
                      IconButton(
                          iconSize: 50,
                          onPressed: () {
                            _isLike = !_isLike;
                            setState(() {});
                          },
                          icon: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Icon(
                                FontAwesomeIcons.heart,
                                color: _isLike
                                    ? Color.fromARGB(255, 135, 207, 196)
                                    : Colors.grey,
                                size: 23,
                              ))))
                    ],
                  ))),
          //hotel info
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ClipRect(
                          child: BackdropFilter(
                              filter:
                                  ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: Container(
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withAlpha(90),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 10),
                                  child: Column(
                                    children: <Widget>[
                                      //hotel name, price
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "Grand Royal\nPark Hotel",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "\$220",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      //location
                                      Row(
                                        children: <Widget>[
                                          Text("Wembley, London",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            size: 16,
                                            color: Color.fromARGB(
                                                255, 84, 211, 194),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text("2 km to city",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          Spacer(),
                                          Text("/per night",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: Icon(
                                                FontAwesomeIcons.solidStar,
                                                size: 12,
                                                color: Color.fromARGB(
                                                    255, 84, 211, 194),
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: Icon(
                                                FontAwesomeIcons.solidStar,
                                                size: 12,
                                                color: Color.fromARGB(
                                                    255, 84, 211, 194),
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: Icon(
                                                FontAwesomeIcons.solidStar,
                                                size: 12,
                                                color: Color.fromARGB(
                                                    255, 84, 211, 194),
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: Icon(
                                                FontAwesomeIcons.solidStar,
                                                size: 12,
                                                color: Color.fromARGB(
                                                    255, 84, 211, 194),
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: Icon(
                                                FontAwesomeIcons.star,
                                                size: 12,
                                                color: Color.fromARGB(
                                                    255, 84, 211, 194),
                                              )),
                                          Text("80 Reviews",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      FlatButton(
                                        onPressed: () {},
                                        child: Container(
                                            height: 47,
                                            decoration: ShapeDecoration(
                                                color: Color.fromARGB(
                                                    255, 84, 211, 194),
                                                shape: StadiumBorder()),
                                            child: Center(
                                              child: Text("Book now",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ))),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        height: 30,
                        child: FlatButton(
                          onPressed: () {
                            _isShowDetailInfo = !_isShowDetailInfo;
                            if (_isShowDetailInfo) {
                              _arrow_animationController.forward();
                            } else {
                              _arrow_animationController.reverse();
                            }

                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("More details",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                width: 10,
                              ),
                              RotationTransition(
                                turns: _arrow_animation,
                                child: Icon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 20,
                                  color: Colors.white.withAlpha(200),
                                ),
                              )
                              // Transform.rotate(
                              //   angle: _isShowDetailInfo ? pi : 0,
                              //   child: Icon(
                              //     FontAwesomeIcons.chevronDown,
                              //     size: 20,
                              //     color: Colors.white.withAlpha(200),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      AnimatedSize(
                        vsync: this,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 500),
                        child: ClipRect(
                            child: BackdropFilter(
                                filter:
                                    ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: _isShowDetailInfo ? 350 : 0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white.withAlpha(90),
                                  ),
                                  child: Scrollbar( //Todo: change indicator color
                                    child: SingleChildScrollView(
                                      child: Container(
                                        child: Text(
                                          """Be it in a big city or a cosy enclave, where there is a PARKROYAL hotel, resort or serviced suite, there is a celebration of people. Whether you’re simply stopping by or staying for long, discover our passion for creating real connections and joyous experiences from the moment you enter any of our 15 properties across Asia and Australia. \nStay in the heart of London – Great location - show map
                                    One of our top picks in London.
                                    Just 3 minutes' walk from Bayswater and Queensway Tube Stations and a 5-minute walk from Hyde Park, this 4-star hotel offers a 24-hour front desk and free WiFi. The modern, compact rooms at the Grand Royale London Hyde Park are decorated in warm colours. They include flat-screen TVs, carpeted flooring and private bathrooms with free toiletries.
                                    
                                    Guests of the Grand Royale London Hyde Park can enjoy breakfast in the elegant restaurant. There is also the Theatre Bar, which has leather armchairs and serves a range of refreshing drinks.
                                    
                                    Surrounded by popular bars and restaurants, the Grand Royale is a 15-minute walk from London Paddington Rail Station, which offers direct connections to Heathrow Airport via the Heathrow Express.
                                    
                                    Westminster Borough is a great choice for travellers interested in shopping, parks and city walks.
                                    
                                    Couples particularly like the location — they rated it 8.5 for a two-person trip.""",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Colors.white.withAlpha(200)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
