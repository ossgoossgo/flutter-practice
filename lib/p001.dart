import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class P001 extends StatelessWidget {
  const P001({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://image.freepik.com/free-photo/beautiful-landscape_8327-295.jpg"))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Spacer(),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                height: 35,
                                width: 35,
                                child: Container(
                                    child: FlatButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.all(0),
                                  child: Container(
                                    child: Center(
                                        child: Text("X",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        shape: BoxShape.circle),
                                  ),
                                )),
                              ))
                        ],
                      ),
                      Spacer(),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Yosemite\nValley,US",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(height: 10),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "\$546",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "per\nperson",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Icon(IconData(59448, fontFamily: 'MaterialIcons'),
                                  color: Color.fromARGB(255, 255, 183, 59),
                                  size: 15),
                              Icon(IconData(59448, fontFamily: 'MaterialIcons'),
                                  color: Color.fromARGB(255, 255, 183, 59),
                                  size: 15),
                              Icon(IconData(59448, fontFamily: 'MaterialIcons'),
                                  color: Color.fromARGB(255, 255, 183, 59),
                                  size: 15),
                              Icon(IconData(59448, fontFamily: 'MaterialIcons'),
                                  color: Color.fromARGB(255, 255, 183, 59),
                                  size: 15),
                              Icon(IconData(59448, fontFamily: 'MaterialIcons'),
                                  color: Colors.white, size: 15)
                            ],
                          )),
                      SizedBox(height: 30)
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("Introduce",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 16, 21, 90),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Yosemite National Park is the best-known of a collection of preserved wild lands in California's Sierra Nevada, a spectacular mountain range near California's border with the state of Nevada. Yosemite National Park's fame is mostly due to the striking beauty of Yosemite Valley, whose flat floor contrasts with nearly vertical granite walls over which pour several major waterfalls. In addition to the Valley, Yosemite includes an extensive high-mountain wilderness of mountain peaks, rivers, and meadows, and groves of giant sequoia trees. Yosemite National Park lands extend from 2000 feet (600m) to more than 13,000 feet (3900m) above sea level and cover about 761,266 acres (308,000 hectares), or about 1,189 square miles.",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 7,
                            style: TextStyle(
                                color: Color.fromARGB(255, 16, 21, 90)),
                          )
                        ],
                      )),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 220, 220),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            IconData(0xe87e, fontFamily: 'MaterialIcons'),
                            color: Color.fromARGB(255, 243, 102, 108),
                            size: 30,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 236, 243),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            IconData(0xe569, fontFamily: 'MaterialIcons'),
                            color: Color.fromARGB(255, 6, 15, 98),
                            size: 30,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 6, 15, 98),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                              child: Text(
                            "BOOK",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    ));
  }
}
