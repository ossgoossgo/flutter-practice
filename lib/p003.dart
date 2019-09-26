import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class P003 extends StatelessWidget {
  const P003({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://image.freepik.com/free-photo/room_23-2148108517.jpg"))),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 60,
                left: 20,

                //1
                // child: Transform.rotate(
                //   alignment: Alignment.centerLeft,
                //   angle: math.pi/2,
                //   child: Text("BoConcept",
                //       style: TextStyle(
                //           fontSize: 60,
                //           color: Colors.white,
                //           fontWeight: FontWeight.w900)),
                // ),

                //2
                // child: RotationTransition(
                //   alignment: Alignment.centerLeft,
                //   turns: AlwaysStoppedAnimation(1 / 4),
                // child: Text("BoConcept",
                //     style: TextStyle(
                //         fontSize: 60,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w900)),
                // ),

                //3
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text("BoConcept",
                      style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  child: Center(
                      child: FlatButton(
                    onPressed: () {},
                    child: Container(
                      height: 50,
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "View gallery",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
