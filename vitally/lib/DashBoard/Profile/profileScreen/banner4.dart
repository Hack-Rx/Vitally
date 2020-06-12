import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Banner4 extends StatefulWidget {
  Banner4({@required this.uid});

  final String uid;

  @override
  _Banner4State createState() => _Banner4State();
}

class _Banner4State extends State<Banner4> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: Firestore.instance.collection(widget.uid).snapshots(),
        builder: (context, snapshot) {
          return Container(
            height: height / (812 / 127),
            width: width / (375 / 331),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Streaks',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.5),
                        child: Text(
                          ' ( days )',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Montserrat',
                              color: Colors.grey[400],
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Calories',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '6',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Montserrat',
                                color: uiGreen,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Container(
                          height: height / (812 / 28),
                          width: 1,
                          color: Colors.grey[300]),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Water',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '11',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Montserrat',
                                color: uiGreen,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Container(
                          height: height / (812 / 28),
                          width: 1,
                          color: Colors.grey[300]),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Steps',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '8',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Montserrat',
                                color: uiGreen,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Container(
                          height: height / (812 / 28),
                          width: 1,
                          color: Colors.grey[300]),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Activity',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '6',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Montserrat',
                                color: uiGreen,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
