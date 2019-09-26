import 'package:flutter/material.dart';
import 'dart:math';

class CreditCards extends StatefulWidget {
  CreditCards({Key key}) : super(key: key);

  _CreditCardsState createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: CardSlider(height: MediaQuery.of(context).size.height * 0.6),
          )),
    );
  }
}

class CardSlider extends StatefulWidget {
  final double height;
  CardSlider({Key key, this.height}) : super(key: key);

  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double positionY_line1;
  double positionY_line2;
  double _middleAreaHeight;
  double _outsideCardInterval;
  double scrollOffsetY;

  List<CardInfo> _cardInfoList;

  @override
  void initState() {
    super.initState();
    positionY_line1 = widget.height * 0.1;
    positionY_line2 = positionY_line1 + 200;

    _middleAreaHeight = positionY_line2 - positionY_line1;
    _outsideCardInterval = 30.0;
    scrollOffsetY = 0;

    _cardInfoList = [
      CardInfo(
          userName: "ANDREW MITCHELL 1",
          leftColor: Color.fromARGB(255, 234, 94, 190),
          rightColor: Color.fromARGB(255, 224, 63, 92)),
      CardInfo(
          userName: "ANDREW MITCHELL 2",
          leftColor: Color.fromARGB(255, 171, 51, 75),
          rightColor: Color.fromARGB(255, 171, 51, 75)),
      CardInfo(
          userName: "ANDREW MITCHELL 3",
          leftColor: Color.fromARGB(255, 10, 10, 10),
          rightColor: Color.fromARGB(255, 10, 10, 10)),
      CardInfo(
          userName: "ANDREW MITCHELL 4",
          leftColor: Color.fromARGB(255, 85, 137, 234),
          rightColor: Color.fromARGB(255, 85, 137, 234))
    ];

    for (var i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[i];
      if (i == 0) {
        cardInfo.postionY = positionY_line1;
        cardInfo.opacity = 1.0;
        cardInfo.scale = 1.0;
        cardInfo.rotate = 1.0;
      } else {
        cardInfo.postionY = positionY_line2 + (i - 1) * 30;
        cardInfo.opacity = 0.7 - (i - 1) * 0.1;
        cardInfo.scale = 0.9;
        cardInfo.rotate = -60;
      }
    }

    _cardInfoList = _cardInfoList.reversed.toList();
  }

  _buildCards() {
    List widgetList = [];

    for (CardInfo cardInfo in _cardInfoList) {
      widgetList.add(Positioned(
          top: cardInfo.postionY,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(pi / 180 * cardInfo.rotate)
              ..scale(cardInfo.scale),
            alignment: Alignment.topCenter,
            child: Opacity(
                opacity: cardInfo.opacity,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(5, 10))
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red,
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [cardInfo.leftColor, cardInfo.rightColor])),
                  width: 300,
                  height: 190,
                  child: Stack(
                    children: <Widget>[
                      //number
                      Positioned(
                        top: 130,
                        left: 20,
                        child: Text("2135",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ),
                      //user name
                      Positioned(
                          top: 160,
                          left: 20,
                          child: Text(cardInfo.userName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700))),
                      //card logo
                      Positioned(
                          right: 10,
                          bottom: 10,
                          child: Container(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                  "assets/images/masterCardLogo.png")))
                    ],
                  ),
                )),
          )));
    }

    return widgetList;
  }

  _updateCardsPosition(double offsetY) {

    //分上中下三個區域
    //上跟下滑動慢,1張卡間距30
    //中間1:1滑動,間距為上下兩條線距離

    //firstCardAtAreaIdx 第一張卡在哪個位置,
    void updatePosition(CardInfo cardInfo, double firstCardAtAreaIdx, int cardIdx){

        double currentCardAtAtreaIdx = firstCardAtAreaIdx + cardIdx;

        //最上面地區
        if(currentCardAtAtreaIdx < 0){

          cardInfo.postionY = positionY_line1+currentCardAtAtreaIdx*_outsideCardInterval;

          cardInfo.rotate =  -90.0/_outsideCardInterval*(positionY_line1-cardInfo.postionY);
          if(cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
          if(cardInfo.rotate < -90.0) cardInfo.rotate = -90.0;

          cardInfo.scale = 1.0 - 0.2/_outsideCardInterval*(positionY_line1-cardInfo.postionY);
          if(cardInfo.scale < 0.8) cardInfo.scale = 0.8;
          if(cardInfo.scale > 1.0) cardInfo.scale = 1.0;

          //1.0->0.7
          cardInfo.opacity = 1.0 - 0.7/_outsideCardInterval*(positionY_line1-cardInfo.postionY);
          if(cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
          if(cardInfo.opacity > 1.0) cardInfo.opacity = 1.0;

        }else if(currentCardAtAtreaIdx>=0 && currentCardAtAtreaIdx<1){
          //中間地區

          cardInfo.postionY = positionY_line1+currentCardAtAtreaIdx*_middleAreaHeight;

          cardInfo.rotate =  -60.0/(positionY_line2-positionY_line1)*(cardInfo.postionY-positionY_line1);
          if(cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
          if(cardInfo.rotate < -60.0) cardInfo.rotate = -60.0;

          //0.9->1.0
          cardInfo.scale = 1.0 - 0.1/(positionY_line2-positionY_line1)*(cardInfo.postionY-positionY_line1);
          if(cardInfo.scale < 0.9) cardInfo.scale = 0.9;
          if(cardInfo.scale > 1.0) cardInfo.scale = 1.0;

          //0.7->1.0
          cardInfo.opacity = 1.0 - 0.3/(positionY_line2-positionY_line1)*(cardInfo.postionY-positionY_line1);
          if(cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
          if(cardInfo.opacity > 1.0) cardInfo.opacity = 1.0;

        }else if(currentCardAtAtreaIdx >=1){

          cardInfo.postionY = positionY_line2 + (currentCardAtAtreaIdx-1)*_outsideCardInterval;

          cardInfo.rotate = -60.0;
          cardInfo.scale = 0.9;
          cardInfo.opacity = 0.7;

        }
   
    }

    scrollOffsetY += offsetY;

    //算出第一張卡在第幾個槽位
    //之後假設每個間隔都是依樣,找出第一張卡在第幾個曹位,然後換算比例得到該區位置
    //firstCardAtAreaIdx的值 0-1第一張就是在中間位置,小於0就是在上端,以此類推其他卡片
    double firstCardAtAreaIdx = scrollOffsetY / _middleAreaHeight;
  
    for (var i = 0; i < _cardInfoList.length; i++) {

      CardInfo cardInfo = _cardInfoList[_cardInfoList.length-1-i];
      updatePosition(cardInfo, firstCardAtAreaIdx, i);
    }

    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails d) {
        _updateCardsPosition(d.delta.dy);
      },
      onVerticalDragEnd: (DragEndDetails d) {

      scrollOffsetY = (scrollOffsetY/_middleAreaHeight).round()*_middleAreaHeight;
      _updateCardsPosition(0);

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 230, 228, 232),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            //title
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("YOUR SECURED CREDIT CARD",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w700)))),

/*
            //line1
            Positioned(
              top: positionY_line1,
              child: Container(
                color: Colors.red,
                height: 1,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            //line2
            Positioned(
              top: positionY_line2,
              child: Container(
                color: Colors.red,
                height: 1,
                width: MediaQuery.of(context).size.width,
              ),
            ),
*/
            ..._buildCards(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 240,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(0, 255, 255, 255),
                            Color.fromARGB(255, 255, 2555, 255),
                          ])),
                )),

            //bottom Btn
            SafeArea(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () => {},
                          child: Icon(
                            Icons.keyboard,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Container(
                            width: 200,
                            height: 55,
                            decoration: ShapeDecoration(shadows: [
                              BoxShadow(
                                  color: Color.fromARGB(100, 75, 136, 230),
                                  blurRadius: 10,
                                  offset: Offset(0, 10))
                            ], color: Colors.blue, shape: StadiumBorder()),
                            child: Center(
                                child: Text("Confirm \$4223",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700))),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () => {},
                          child: Icon(
                            Icons.mic,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class CardInfo {
  Color leftColor;
  Color rightColor;
  String userName;
  String cardCategory;
  double postionY = 0;
  double rotate = 0;
  double opacity = 0;
  double scale = 0;
  CardInfo(
      {this.userName,
      this.cardCategory,
      this.postionY,
      this.rotate,
      this.opacity,
      this.scale,
      this.leftColor,
      this.rightColor});
}


