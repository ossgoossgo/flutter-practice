import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class QRcodePage extends StatefulWidget {
  QRcodePage({Key key}) : super(key: key);

  _QRcodePageState createState() => _QRcodePageState();
}

class _QRcodePageState extends State<QRcodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 70, 255),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Payment',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 9,
              child: Container(
                  margin: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 251, 252),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 30,
                            offset: Offset(0, 10))
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      //background
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        //content
                        child: Column(
                          children: <Widget>[
                            //top info
                            Expanded(
                              flex: 4,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 40),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 30,
                                          offset: Offset(0, 20))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(Icons.more_horiz,
                                                  size: 40,
                                                  color:
                                                      Colors.grey.shade400))),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, bottom: 30),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text("136ae**347",
                                                        style: TextStyle(
                                                            fontSize: 28,
                                                            color: Colors
                                                                .grey.shade600,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Scan tow-dimensional code payment.",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Flexible(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 30),
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 19, 71, 255),
                                                    shape: BoxShape.circle),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 25,
                                                      height: 25,
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                    ),
                                                    Text("支",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromARGB(
                                                              255, 19, 71, 255),
                                                        ))
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                children: <Widget>[
                                  QrImage(
                                      data: "1234567890",
                                      version: QrVersions.auto,
                                      size: 280.0,
                                      foregroundColor:
                                          Color.fromARGB(255, 80, 93, 124))
                                ],
                              ),
                            ),
                            //BarCode
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Opacity(
                                      opacity: 0.5,
                                      child: BarCodeImage(
                                        foregroundColor:
                                            Color.fromARGB(255, 80, 93, 124),
                                        data:
                                            "2690123456789", // Code string. (required)
                                        codeType: BarCodeType
                                            .Code39, // Code type (required)
                                        lineWidth:
                                            1.4, // width for a single black/white bar (default: 2.0)
                                        barHeight:
                                            50.0, // height for the entire widget (default: 100.0)
                                        hasText:
                                            true, // Render with text label or not (default: false)
                                        onError: (error) {
                                          // Error handler
                                          print('error = ');
                                        },
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )))),
          //Bottom text
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top:40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Password Payment",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 30)
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
