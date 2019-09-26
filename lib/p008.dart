import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';

class P008 extends StatefulWidget {
  P008({Key key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<P008> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w700,
              letterSpacing: 2),
        ),
        backgroundColor: Colors.white,
        leading:
            Icon(FontAwesomeIcons.bars, color: Colors.grey.shade800, size: 18),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                FontAwesomeIcons.bell,
                color: Colors.grey.shade900,
                size: 18,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedFontSize: 12,
        showSelectedLabels: false,
        selectedItemColor: Colors.grey.shade700,
        unselectedItemColor: Colors.grey.shade400,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
              ),
              title: SizedBox(
                width: 0,
                height: 0,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.mapMarkerAlt,
              ),
              title: SizedBox(
                width: 0,
                height: 0,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bookmark,
              ),
              title: SizedBox(
                width: 0,
                height: 0,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
              ),
              title: SizedBox(
                width: 0,
                height: 0,
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cog),
              title: SizedBox(
                width: 0,
                height: 0,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width - 20 * 2,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey.shade600),
                            border: InputBorder.none,
                            hintText: "Search",
                            prefixIcon: Icon(
                              FontAwesomeIcons.search,
                              size: 15,
                            )),
                      )))),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
            child: Text("What do you want to eat?",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    color: Colors.grey.shade900)),
          ),
          Expanded(
            flex: 6,
            child: Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15),
                      itemBuilder: (context, idx) {
                        return Container(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 4,
                                              color: Color.fromARGB(
                                                  255, 193, 212, 150),
                                            )),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Opacity(
                                            opacity: 0.7,
                                            child: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/images/salad.png"), // Icon made by turkkub from www.flaticon.com
                                            ),
                                          )),
                                      Text(
                                        "Salad",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade700,
                                            letterSpacing: 1),
                                      )
                                    ],
                                  ))),
                        );
                      },
                    ))),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5,
              top: 0,
              bottom: 0,
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Today",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                        color: Colors.grey.shade900))),
          ),
          SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
                child: Container(
                    alignment: Alignment.center,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 20),
                        itemExtent: MediaQuery.of(context).size.width * 0.8,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://image.freepik.com/free-photo/top-view-mixed-vegetables-salad-muesli-fresh-fruits-white-background_35378-2042.jpg")),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "The Greenhouse Intelligently food",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            size: 13,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Fast food \$35",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.solidStar,
                                              size: 8,
                                              color: Colors.yellow.shade700),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Icon(FontAwesomeIcons.solidStar,
                                              size: 8,
                                              color: Colors.yellow.shade700),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Icon(FontAwesomeIcons.solidStar,
                                              size: 8,
                                              color: Colors.yellow.shade700),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Icon(FontAwesomeIcons.solidStar,
                                              size: 8,
                                              color: Colors.yellow.shade700),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Icon(FontAwesomeIcons.solidStar,
                                              size: 8,
                                              color: Colors.grey.shade400),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text("4.3",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 10))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }))),
          ),
        ],
      ),
    );
  }
}
