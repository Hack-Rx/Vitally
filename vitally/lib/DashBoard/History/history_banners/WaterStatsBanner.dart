import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WaterStats extends StatefulWidget {
  WaterStats({@required this.uid});
  final String uid;

  @override
  _WaterStatsState createState() => _WaterStatsState();
}

class _WaterStatsState extends State<WaterStats> {
  int today_weekday = DateTime.now().weekday;

  String date1 = (DateTime.now().day - 6).toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();
  String date2 = (DateTime.now().day - 5).toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();
  String date3 = (DateTime.now().day - 4).toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();
  String date4 = (DateTime.now().day - 3).toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();
  String date5 = (DateTime.now().day - 2).toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();
  String date6 = (DateTime.now().day - 1).toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();
  String date7 = DateTime.now().day.toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();

  String WeekDay(int day) {
    String weekday;
    if (day == 1) {
      weekday = 'Mon';
    } else if (day == 2) {
      weekday = 'Tue';
    } else if (day == 3) {
      weekday = 'Wed';
    } else if (day == 4) {
      weekday = 'Thu';
    } else if (day == 5) {
      weekday = 'Fri';
    } else if (day == 6) {
      weekday = 'Sat';
    } else if (day == 7) {
      weekday = 'Sun';
    } else if (day == -1) {
      weekday = 'Sat';
    } else if (day == -2) {
      weekday = 'Fri';
    } else if (day == -3) {
      weekday = 'Thu';
    } else if (day == -4) {
      weekday = 'Wed';
    } else if (day == -5) {
      weekday = 'Tue';
    } else if (day == -6) {
      weekday = 'Mon';
    } else if (day == -7) {
      weekday = 'Sun';
    } else if (day == 0) {
      weekday = 'Sun';
    }

    return weekday;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: Firestore.instance
            .collection(widget.uid)
            .document('userData')
            .collection(date7)
            .snapshots(),
        builder: (context, snapshot) {
          bool water7 = (snapshot.data.documents[1]['consumedQuantity']) == null
              ? false
              : (snapshot.data.documents[1]['consumedQuantity']) >= 3000
                  ? true
                  : false;

          return StreamBuilder(
              stream: Firestore.instance
                  .collection(widget.uid)
                  .document('userData')
                  .collection(date6)
                  .snapshots(),
              builder: (context, snapshot) {
                bool water6 = (snapshot.data.documents[1]
                            ['consumedQuantity']) ==
                        null
                    ? false
                    : (snapshot.data.documents[1]['consumedQuantity']) >= 3000
                        ? true
                        : false;
                return StreamBuilder(
                    stream: Firestore.instance
                        .collection(widget.uid)
                        .document('userData')
                        .collection(date5)
                        .snapshots(),
                    builder: (context, snapshot) {
                      bool water5 = (snapshot.data.documents[1]
                                  ['consumedQuantity']) ==
                              null
                          ? false
                          : (snapshot.data.documents[1]['consumedQuantity']) >=
                                  3000
                              ? true
                              : false;
                      return StreamBuilder(
                          stream: Firestore.instance
                              .collection(widget.uid)
                              .document('userData')
                              .collection(date4)
                              .snapshots(),
                          builder: (context, snapshot) {
                            bool water4 = (snapshot.data.documents[1]
                                        ['consumedQuantity']) ==
                                    null
                                ? false
                                : (snapshot.data.documents[1]
                                            ['consumedQuantity']) >=
                                        3000
                                    ? true
                                    : false;
                            return StreamBuilder(
                                stream: Firestore.instance
                                    .collection(widget.uid)
                                    .document('userData')
                                    .collection(date3)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  bool water3 = (snapshot.data.documents[1]
                                              ['consumedQuantity']) ==
                                          null
                                      ? false
                                      : (snapshot.data.documents[1]
                                                  ['consumedQuantity']) >=
                                              3000
                                          ? true
                                          : false;
                                  return StreamBuilder(
                                      stream: Firestore.instance
                                          .collection(widget.uid)
                                          .document('userData')
                                          .collection(date2)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        bool water2 = (snapshot
                                                        .data.documents[1]
                                                    ['consumedQuantity']) ==
                                                null
                                            ? false
                                            : (snapshot.data.documents[1]
                                                        ['consumedQuantity']) >=
                                                    3000
                                                ? true
                                                : false;
                                        return StreamBuilder(
                                            stream: Firestore.instance
                                                .collection(widget.uid)
                                                .document('userData')
                                                .collection(date1)
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              bool water1 = (snapshot.data
                                                              .documents[1][
                                                          'consumedQuantity']) ==
                                                      null
                                                  ? false
                                                  : (snapshot.data.documents[1][
                                                              'consumedQuantity']) >=
                                                          3000
                                                      ? true
                                                      : false;
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                width: width / (375 / 331),
                                                height: 110,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            'Water Stats',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 18),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    6.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Container(
                                                                height: 51,
                                                                width: 38,
                                                                child:
                                                                    Image.asset(
                                                                  'assets/Glass (1).png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  filterQuality:
                                                                      FilterQuality
                                                                          .high,
                                                                )),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          20.0),
                                                              child: Container(
                                                                height: 42,
                                                                width: 214,
                                                                child: Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        height:
                                                                            53,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              water1 ? Icons.event_available : Icons.event_busy,
                                                                              size: 20,
                                                                              color: water1 ? uiGreen : Colors.red,
                                                                            ),
                                                                            Text(
                                                                              WeekDay(today_weekday - 6).toString(),
                                                                              style: TextStyle(color: Colors.grey[500], fontFamily: 'Montserrat', fontSize: 9),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            53,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              water2 ? Icons.event_available : Icons.event_busy,
                                                                              size: 20,
                                                                              color: water2 ? uiGreen : Colors.red,
                                                                            ),
                                                                            Text(
                                                                              WeekDay(today_weekday - 5).toString(),
                                                                              style: TextStyle(color: Colors.grey[500], fontFamily: 'Montserrat', fontSize: 9),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            53,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              water3 ? Icons.event_available : Icons.event_busy,
                                                                              size: 20,
                                                                              color: water3 ? uiGreen : Colors.red,
                                                                            ),
                                                                            Text(
                                                                              WeekDay(today_weekday - 4).toString(),
                                                                              style: TextStyle(color: Colors.grey[500], fontFamily: 'Montserrat', fontSize: 9),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            53,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              water4 ? Icons.event_available : Icons.event_busy,
                                                                              size: 20,
                                                                              color: water4 ? uiGreen : Colors.red,
                                                                            ),
                                                                            Text(
                                                                              WeekDay(today_weekday - 3).toString(),
                                                                              style: TextStyle(color: Colors.grey[500], fontFamily: 'Montserrat', fontSize: 9),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            53,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              water5 ? Icons.event_available : Icons.event_busy,
                                                                              size: 20,
                                                                              color: water5 ? uiGreen : Colors.red,
                                                                            ),
                                                                            Text(
                                                                              WeekDay(today_weekday - 2).toString(),
                                                                              style: TextStyle(color: Colors.grey[500], fontFamily: 'Montserrat', fontSize: 9),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            53,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              water6 ? Icons.event_available : Icons.event_busy,
                                                                              size: 20,
                                                                              color: water6 ? uiGreen : Colors.red,
                                                                            ),
                                                                            Text(
                                                                              WeekDay(today_weekday - 1).toString(),
                                                                              style: TextStyle(color: Colors.grey[500], fontFamily: 'Montserrat', fontSize: 9),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            53,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              water7 ? Icons.event_available : Icons.event_busy,
                                                                              size: 20,
                                                                              color: water7 ? uiGreen : Colors.red,
                                                                            ),
                                                                            Text(
                                                                              WeekDay(today_weekday).toString(),
                                                                              style: TextStyle(color: Colors.grey[500], fontFamily: 'Montserrat', fontSize: 9),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                            });
                                      });
                                });
                          });
                    });
              });
        });
  }
}
