import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'history_banners/yourProgressBat.dart';
import 'history_banners/DailyWeightUpdateBanner.dart';
import 'history_banners/WaterStatsBanner.dart';
import 'history_banners/CalorieGraphBanner.dart';

class History extends StatefulWidget {
  History({@required this.uid});
  final String uid;

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: uiBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ProgressBar(uid: widget.uid),
            Expanded(
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        DailyWeightUpdate(uid: widget.uid),
                        SizedBox(height: 10),
                        CaloriesGraph(
                          uid: widget.uid,
                        ),
                        SizedBox(height: 10),
                        WaterStats(
                          uid: widget.uid,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
