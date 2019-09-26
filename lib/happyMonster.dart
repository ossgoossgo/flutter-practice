import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HappyMonster extends StatefulWidget {
  HappyMonster({Key key}) : super(key: key);

  _HappyMonsterState createState() => _HappyMonsterState();
}

class _HappyMonsterState extends State<HappyMonster> {
  int currentPage = 0;
  PageController pageController;
  double pageControllerPage = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 67, 13, 119),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  setState(() {
                    pageControllerPage = pageController.page;
                    print(pageControllerPage);
                  });
                },
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (pageIdx) {
                    currentPage = pageIdx;
                  },
                  physics: BouncingScrollPhysics(),
                  itemCount: 99,
                  itemBuilder: (context, idx) {
                    print("controllerPage=${pageControllerPage}, idx=${idx}");
                    double offsetY = (pageControllerPage - idx).abs() * 20;
                    return Container(
                      alignment: Alignment.bottomCenter,
                      child: Transform.translate(
                          offset: Offset(0, -offsetY),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 280,
                            width: 84,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60)),
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  idx.toString(),
                                  style: TextStyle(
                                      fontSize:
                                          (pageControllerPage.round() == idx)
                                              ? 50
                                              : 30,
                                      fontWeight: FontWeight.w700,
                                      color: (pageControllerPage.round() == idx)
                                          ? Color.fromARGB(255, 15, 39, 107)
                                          : Colors.grey),
                                )),
                          )),
                    );
                  },
                )),
          ),
          IgnorePointer(
              child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage("assets/images/monsterBG.png")),
            ),
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text("How old is Micheal?",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)))),
          )),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Text("Years old",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FlatButton(
                onPressed: () {},
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 30,
                ),
              )
            )
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FlatButton(
                color: Colors.red,
                shape: CircleBorder(),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                    size: 30,
                  )
                ),
              )
            )
          )
        ],
      ),
    );
  }
}

// Thanks for yours watching~ ^^
// If you like this, Please subscribe my YouTube channel.