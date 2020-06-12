import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBar extends StatefulWidget {
  UserBar({@required this.uid});
  final String uid;

  @override
  _UserBarState createState() => _UserBarState();
}

class _UserBarState extends State<UserBar> {
  @override
  Widget build(BuildContext context) {
    var _DateStyle = TextStyle(
        color: uiGreen,
        fontFamily: 'Montserrat',
        fontSize: 10,
        fontWeight: FontWeight.bold);
    var _nameStyle = TextStyle(
        color: uiBlue,
        fontFamily: 'Montserrat',
        fontSize: 24,
        fontWeight: FontWeight.w600);

    String today() {
      String weekday;
      String date;
      String month;
      if (DateTime.now().weekday == 1) {
        weekday = 'MON  ';
      } else if (DateTime.now().weekday == 2) {
        weekday = 'TUE  ';
      } else if (DateTime.now().weekday == 3) {
        weekday = 'WED  ';
      } else if (DateTime.now().weekday == 4) {
        weekday = 'THURS  ';
      } else if (DateTime.now().weekday == 5) {
        weekday = 'FRI  ';
      } else if (DateTime.now().weekday == 6) {
        weekday = 'SAT  ';
      } else if (DateTime.now().weekday == 7) {
        weekday = 'SUN  ';
      }
      date = DateTime.now().day.toString();
      if (DateTime.now().month == 1) {
        month = 'JAN';
      } else if (DateTime.now().month == 2) {
        month = 'FEB';
      } else if (DateTime.now().month == 3) {
        month = 'MAR';
      } else if (DateTime.now().month == 4) {
        month = 'APR';
      } else if (DateTime.now().month == 5) {
        month = 'MAY';
      } else if (DateTime.now().month == 6) {
        month = 'JUN';
      } else if (DateTime.now().month == 7) {
        month = 'JUL';
      } else if (DateTime.now().month == 8) {
        month = 'AUG';
      } else if (DateTime.now().month == 9) {
        month = 'SEPT';
      } else if (DateTime.now().month == 10) {
        month = 'OCT';
      } else if (DateTime.now().month == 11) {
        month = 'NOV';
      } else if (DateTime.now().month == 12) {
        month = 'DEC';
      }

      return weekday + date + '  ' + month;
    }

    return StreamBuilder(
        stream: Firestore.instance.collection(widget.uid).snapshots(),
        builder: (context, snapshot) {
          String name = (snapshot.data.documents[2]['userName']) == null
              ? 0
              : (snapshot.data.documents[2]['userName']);
          ;

          return Container(
            padding: EdgeInsets.fromLTRB(32, 62, 32, 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400], blurRadius: 10, spreadRadius: 3)
              ],
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.wb_sunny,
                          color: uiGreen,
                          size: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(today(), style: _DateStyle),
                        )
                      ],
                    ),
                    Text(
                      'Hi, ' + name,
                      style: _nameStyle,
                    )
                  ],
                ),
                Image.asset('assets/DP.png')
              ],
            ),
          );
        });
  }
}
