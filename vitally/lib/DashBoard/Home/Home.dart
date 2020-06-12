import 'package:flutter/material.dart';
import 'package:vitally/DashBoard/Home/UserBar.dart';
import 'package:vitally/DashBoard/Home/DailyCalorieMonitor.dart';
import 'package:vitally/DashBoard/Home/WaterIntakeMonitor.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.uid});
  final String uid;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    try {
      return SingleChildScrollView(
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  DailyCalorieMonitor(
                    uid: widget.uid,
                  ),
                ],
              ),
              UserBar(
                uid: widget.uid,
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          WaterIntake(),
          SizedBox(
            height: 6,
          ),
          WaterIntake()
        ]),
      );
    } catch (e) {
      return Center(child: Text('Loading'));
    }
  }
}
