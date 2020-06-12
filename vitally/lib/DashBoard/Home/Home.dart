import 'package:flutter/material.dart';
import 'package:vitally/DashBoard/Home/UserBar.dart';
import 'package:vitally/DashBoard/Home/DailyCalorieMonitor.dart';
import 'package:vitally/DashBoard/Home/WaterIntakeMonitor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Stack(
        children: <Widget>[DailyCalorieMonitor(), UserBar()],
      ),
      SizedBox(
        height: 6,
      ),
      WaterIntake()
    ]);
  }
}
