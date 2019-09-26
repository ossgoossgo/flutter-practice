import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class P002 extends StatelessWidget {
  const P002({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 100),
              child: Container(
                color: Colors.white,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            width: 35,
                          ),
                          Text("Today",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w800)),
                          Spacer(),
                          CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/avatar.png",
                                  fit: BoxFit.fill,
                                  height: 60,
                                  width: 60,
                                ),
                              )),
                          SizedBox(width: 10)
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 100),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.black,
                          tabs: <Widget>[
                            Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "NEW",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                )),
                            Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "TRAINING",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )),
                            Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "PLAN",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 59, 46, 55),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(10)),
                                ),
                                width: 160,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 0,
                                      top: 40,
                                      child: Image.asset(
                                        "assets/images/line1.png",
                                        width: 130,
                                        height: 200,
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(40),
                                          ),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromARGB(255, 59, 46, 55),
                                                Color.fromARGB(0, 59, 46, 55),
                                              ])),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 0,
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  "108",
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "bpm",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      bottom: 20,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text("Heart rate",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white
                                                    .withOpacity(0.5))),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(width: 10),
                          Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 214, 77, 96),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(10)),
                                ),
                                width: 160,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 0,
                                      top: 40,
                                      child: Image.asset(
                                        "assets/images/line2.png",
                                        width: 130,
                                        height: 200,
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(40),
                                          ),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromARGB(
                                                    255, 214, 77, 96),
                                                Color.fromARGB(0, 214, 77, 96),
                                              ])),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 0,
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  "3880",
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "m",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      bottom: 20,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text("Mileage",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white
                                                    .withOpacity(0.5))),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      )),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30, bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("Latest training",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 59, 46, 55),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800))
                          ],
                        ))),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://img.freepik.com/free-photo/female-fitness-trainer-gym_1303-13570.jpg?size=626&ext=jpg")),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Perfect your body",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                            Text(
                              "Six training",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.7)),
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          FontAwesomeIcons.solidClock,
                          size: 30,
                          color: Color.fromARGB(255, 59, 46, 55),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 59, 46, 55),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(10))),
                        child: Icon(
                          FontAwesomeIcons.running,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/images/chart.png",
                              fit: BoxFit.fill)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
