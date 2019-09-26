import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParallaxPageView extends StatefulWidget {
  ParallaxPageView({Key key}) : super(key: key);

  _ParallaxPageViewState createState() => _ParallaxPageViewState();
}

class _ParallaxPageViewState extends State<ParallaxPageView> {
  List<PageInfo> _pageInfoList;

  PageController _pageController;
  double _pageOffset;
  int _currentPageIdx;

  @override
  void initState() {
    super.initState();

    _pageOffset = 0.0;
    _currentPageIdx = 0;

    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _pageOffset = _pageController.page;
        });
      });

    _pageInfoList = [
      PageInfo(
          title: "Parsley",
          backgroundColor: Color.fromARGB(255, 162, 214, 214),
          imagepath: "assets/images/parsley.png"),
      PageInfo(
          title: "Tomato",
          backgroundColor: Color.fromARGB(255, 244, 177, 164),
          imagepath: "assets/images/tomato.png"),
      PageInfo(
          title: "Carrots",
          backgroundColor: Color.fromARGB(255, 209, 199, 158),
          imagepath: "assets/images/carrots.png"),
    ];
  }

  _getBGColor() {
    //print(_pageOffset);

    if (_pageOffset.toInt() + 1 < _pageInfoList.length) {
      Color currentBGColor = _pageInfoList[_pageOffset.toInt()].backgroundColor;
      Color nextBGColor =
          _pageInfoList[_pageOffset.toInt() + 1].backgroundColor;
      return Color.lerp(
          currentBGColor, nextBGColor, _pageOffset - _pageOffset.toInt());
    } else {
      return _pageInfoList.last.backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBGColor(),
      body: Column(
        children: <Widget>[
          _buildNavigationBar(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pageInfoList.length,
              itemBuilder: (context, idx) {
                return Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 80,
                          left: 110,
                          child: Transform.translate(
                              offset: Offset(-(_pageOffset - idx) * 100, 0),
                              child: Text(_pageInfoList[idx].title,
                                  style: TextStyle(
                                      fontSize: 90,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)))),
                      Positioned(
                          top: 300,
                          left: 30,
                          child: Column(
                            children: <Widget>[
                              _buildOtherInfo(),
                              SizedBox(height: 25),
                              _buildOtherInfo(),
                              SizedBox(height: 25),
                              _buildOtherInfo(),
                              SizedBox(height: 25),
                              _buildOtherInfo(),
                            ],
                          )),
                      Positioned(
                          top: 240,
                          left: 200,
                          child: Transform.translate(
                              offset: Offset(-(_pageOffset - idx) * 700, 0),
                              child: SizedBox(
                                  width: 400,
                                  height: 400,
                                  child: Image.asset(
                                      _pageInfoList[idx].imagepath))))
                    ],
                  ),
                );
              },
            ),
          ),
          _buildBottomBar()
        ],
      ),
    );
  }

  _buildOtherInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.exclamationTriangle,
          color: Colors.white,
          size: 40,
        ),
        SizedBox(
          width: 30,
        ),
        Transform.translate(
            offset: Offset(0, 10),
            child: Text("6.4",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
        SizedBox(
          width: 10,
        ),
        Text("pH",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ],
    );
  }

  _buildNavigationBar() {
    return SafeArea(
        bottom: false,
        child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.home,
                          color: Colors.white,
                          size: 36,
                        ))),
                Center(
                    child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(
                                text: "EASY",
                                style:
                                    TextStyle(fontSize: 20, letterSpacing: 3),
                                children: <TextSpan>[
                              TextSpan(
                                  text: "GROW",
                                  style: TextStyle(fontWeight: FontWeight.w700))
                            ])))),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(8)),
                      )),

                  //上面下面都行
                  /*
                    ButtonTheme(
                        padding: EdgeInsets.only(left: 10),
                        minWidth: 60,
                        child: FlatButton(
                          onPressed: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ))
                        */
                ),
                Positioned(
                    right: -10,
                    top: -5,
                    child: IgnorePointer(
                        child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(minHeight: 30, minWidth: 30),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: ShapeDecoration(
                          shape: StadiumBorder(), color: Colors.red),
                      child: Text("3",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    )))
              ],
            )));
  }
}

_buildBottomBar() {
  return Container(
    color: Colors.white,
    height: 80,
  );
}

class PageInfo {
  String title;
  Color backgroundColor;
  String imagepath;
  PageInfo({this.title, this.backgroundColor, this.imagepath});
}
