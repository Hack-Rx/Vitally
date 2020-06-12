import 'package:vitally/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class WaterDailyTarget extends StatefulWidget {
  WaterDailyTarget({@required this.uid, @required this.WaterMeter});

  final String uid;
  final int WaterMeter;

  @override
  _WaterDailyTargetState createState() => _WaterDailyTargetState();
}

class _WaterDailyTargetState extends State<WaterDailyTarget> {
  DateTime now = DateTime.now().subtract(Duration(days: 1));
  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().day.toString() +
        DateTime.now().month.toString() +
        DateTime.now().year.toString();
    String time = DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString() +
        ':' +
        DateTime.now().second.toString();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Stream<QuerySnapshot> stream1 =
        Firestore.instance.collection(widget.uid).snapshots();
    Stream<QuerySnapshot> stream2 = Firestore.instance
        .collection(widget.uid)
        .document('userData')
        .collection('$today')
        .snapshots();

    return StreamBuilder(
        stream: stream1,
        builder: (context, snapshot) {
          int dailyWater = (snapshot.data.documents[2]['DailyWater']) == null
              ? 3000
              : (snapshot.data.documents[2]['DailyWater']);

          return StreamBuilder(
              stream: stream2,
              builder: (context, snapshot) {
                int waterConsumed = widget.WaterMeter;

                return Container(
                  height: height / (812 / 90),
                  width: width,
                  color: uiSkyBlue,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Daily Target : ' + dailyWater.toString() + ' ml',
                        style: dailyWatertext,
                      ),
                      SizedBox(height: 15),
                      Text(
                          waterConsumed.toString() +
                              ' of ' +
                              dailyWater.toString() +
                              ' ml',
                          style: searchbartext)
                    ],
                  ),
                );
              });
        });
  }
}
