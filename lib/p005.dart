import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class P005 extends StatefulWidget {
  P005({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<P005> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 231, 231, 232),
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 3 / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/lamp1.png")),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Icon(Icons.arrow_back_ios, color: Colors.black),
              actions: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(40))),
                  child: Icon(
                    FontAwesomeIcons.shoppingBasket,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            body: Stack(
              children: <Widget>[
                Positioned(
                    bottom: 30,
                    left: 0,
                    child: SafeArea(
                        child: Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemExtent:
                                    MediaQuery.of(context).size.width * 0.8,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius:20)],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 25,
                                              right: 15,
                                              top: 20,
                                              bottom: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 5,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text("LittMcMonn",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                          Text(
                                                            "Theo II",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 20),
                                                          ),
                                                          Text(
                                                            "Table Lamp",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10),
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 60,
                                                          child: Image.asset(
                                                            "assets/images/lamp2.png",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: SizedBox(
                                                    width: 250,
                                                    child: Text(
                                                      "LittMCMann Thero II is a classic model of a table lamp, which will fit any chic and elegant interior.",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      "\$92,00",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 22),
                                                    ),
                                                    Container(
                                                        height: 48,
                                                        width: 110,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    183,
                                                                    154,
                                                                    182),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        child: Center(
                                                            child: Text(
                                                          "DETAILS",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.8),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15),
                                                        )))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                }))))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Icon(
//           Icons.arrow_back_ios,
//           color: Colors.black,
//         ),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height * 3 / 4,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage("assets/images/lamp1.png")),
//             ),
//             child: Placeholder(),
//           )
//         ],
//       ),
//     );
