import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';
import 'package:toast/toast.dart';

class DailyWeightUpdate extends StatefulWidget {
  DailyWeightUpdate({@required this.uid});
  final String uid;

  @override
  _DailyWeightUpdateState createState() => _DailyWeightUpdateState();
}

class _DailyWeightUpdateState extends State<DailyWeightUpdate> {
  int weight = 60;
  String month() {
    String month;
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
    return month;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      width: width / (375 / 331),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Daily Weight Update',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      ' (kgs)',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    )
                  ],
                ),
                Text(
                  DateTime.now().day.toString() + '  ' + month(),
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontFamily: 'Montserrat'),
                )
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              weight--;
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: uiGreen,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              weight++;
                              print(weight);
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: uiGreen,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      userDataHelpUsForm(uid: widget.uid)
                          .weightUpdate(weight)
                          .whenComplete(() => Toast.show(
                              'Weight Successfully Updated', context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM,
                              textColor: Colors.black,
                              backgroundColor: Colors.grey[300]));
                    },
                    child: Container(
                      height: 40,
                      width: 118,
                      decoration: BoxDecoration(
                        color: uiBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
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
  }
}
