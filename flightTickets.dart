import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/animation.dart';

class FlightTicket extends StatefulWidget {
  FlightTicket({Key key}) : super(key: key);
  _State createState() => _State();
}

class _State extends State<FlightTicket> {
  int _currentSelect = 0;

  List<TicketInfo> _ticketInfoList = [
    TicketInfo(
        price: "\$25",
        time: "06:30 PM",
        from: "W 90th St, New York, NY 10025",
        to: "46th Ave, Woodside, NY 11101",
        requests: "5",
        pledge: "\$150",
        weight: "light",
        color: Color.fromARGB(255, 186, 104, 200)),
    TicketInfo(
        price: "\$37",
        time: "07:30 AM",
        from: "W 85th St, New York, NY 1025",
        to: "E 30th Ave, New York, NY 1001",
        requests: "7",
        pledge: "\$222",
        weight: "heavy",
        color: Color.fromARGB(255, 82, 164, 58)),
    TicketInfo(
        price: "\$12",
        time: "09:22 PM",
        from: "W 79th St, New York, NY 1024",
        to: "E 139th Ave, New York, NY 1030",
        requests: "3",
        pledge: "\$80",
        weight: "light",
        color: Color.fromARGB(255, 247, 170, 23)),
    TicketInfo(
        price: "\$80",
        time: "09:22 PM",
        from: "W 90th St, New York, NY 125",
        to: "E 46th Ave, New York, NY 11",
        requests: "3",
        pledge: "\$80",
        weight: "light",
        color: Color.fromARGB(255, 239, 83, 80)),
    TicketInfo(
        price: "\$80",
        time: "09:22 PM",
        from: "W 90th St, New York, NY 125",
        to: "E 46th Ave, New York, NY 11",
        requests: "3",
        pledge: "\$80",
        weight: "light",
        color: Color.fromARGB(255, 239, 83, 80)),
    TicketInfo(
        price: "\$80",
        time: "09:22 PM",
        from: "W 90th St, New York, NY 125",
        to: "E 46th Ave, New York, NY 11",
        requests: "3",
        pledge: "\$80",
        weight: "light",
        color: Color.fromARGB(255, 239, 83, 80)),
    TicketInfo(
        price: "\$80",
        time: "09:22 PM",
        from: "W 90th St, New York, NY 125",
        to: "E 46th Ave, New York, NY 11",
        requests: "3",
        pledge: "\$80",
        weight: "light",
        color: Color.fromARGB(255, 239, 83, 80)),
    TicketInfo(
        price: "\$80",
        time: "09:22 PM",
        from: "W 90th St, New York, NY 125",
        to: "E 46th Ave, New York, NY 11",
        requests: "3",
        pledge: "\$80",
        weight: "light",
        color: Color.fromARGB(255, 239, 83, 80)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 82, 90, 117),
        child: ListView.builder(
            itemCount: _ticketInfoList.length,
            itemExtent: 200.0,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    _currentSelect = index;
                    setState(() {});
                    print("_currentSelect = ${_currentSelect}");
                  },
                  child: _buildItem(index));
            }),
      ),
    );
  }

  _buildItem(index) {
    TicketInfo ticketInfo = _ticketInfoList[index];
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: <Widget>[
            LeftArea(
                ticketInfo: ticketInfo, isSelected: (_currentSelect == index)),
            Container(
              width: 1,
              margin: EdgeInsets.only(left: 100),
              child: Center(
                child: Container(
                  height: 150,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 100),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(1),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: ticketInfo.color),
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(1),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        color: ticketInfo.color,
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(1),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        color: ticketInfo.color,
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(1),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        color: ticketInfo.color,
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(1),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        color: ticketInfo.color,
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(1),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: ticketInfo.color),
                                        shape: BoxShape.circle),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(ticketInfo.from,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700)),
                              SizedBox(
                                height: 9,
                              ),
                              Divider(
                                height: 1,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(ticketInfo.to,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 35, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("REQUESTS",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w600)),
                              Text(ticketInfo.requests,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("PLEDGE",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w600)),
                              Text(ticketInfo.pledge,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("WEIGHT",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w600)),
                              Text(ticketInfo.weight,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w600)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LeftColorClipper extends CustomClipper<Rect> {
  double clipWidth = 0;
  _LeftColorClipper(this.clipWidth);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, size.height, clipWidth + 10, 0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class TicketInfo {
  String price;
  String time;
  String from;
  String to;
  String requests;
  String pledge;
  String weight;
  Color color;

  TicketInfo(
      {this.price,
      this.time,
      this.from,
      this.to,
      this.requests,
      this.pledge,
      this.weight,
      this.color});
}

class LeftArea extends StatefulWidget {
  final TicketInfo ticketInfo;
  final bool isSelected;
  final int index;

  LeftArea({Key key, this.ticketInfo, this.isSelected, this.index})
      : super(key: key);
  _LeftAreaState createState() => _LeftAreaState();
}

class _LeftAreaState extends State<LeftArea>
    with SingleTickerProviderStateMixin {
  bool isSelected = false;
  AnimationController _animationController;
  Animation<double> _animationWidth;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _animationWidth =
        Tween(begin: 10.0, end: 100.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });

    if (widget.isSelected) {
      _animationController.forward(from: 100.0);
    } else {
      _animationController.reverse(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    if (isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      isSelected = widget.isSelected;
    }

    return Container(
      child: Stack(
        children: <Widget>[
          //left background
          Container(
            padding: EdgeInsets.only(left: 15),
            width: _animationWidth.value,
            decoration: BoxDecoration(
                color: widget.ticketInfo.color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
          ),
          // layer1
          Container(
            padding: EdgeInsets.only(left: 20),
            width: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(widget.ticketInfo.price,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700)),
                Spacer(),
                Text("TODAY",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                            .withOpacity(0.6))), //Colors.white.withOpacity(0.6)
                Text(
                  widget.ticketInfo.time,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // layer2
          ClipRect(
              clipper: _LeftColorClipper(
                  _animationWidth.value), //widget.isSelected ? 0.0 : 100.0
              child: Container(
                padding: EdgeInsets.only(left: 20),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(widget.ticketInfo.price,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    Spacer(),
                    Text("TODAY",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.6))),
                    Text(
                      widget.ticketInfo.time,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
