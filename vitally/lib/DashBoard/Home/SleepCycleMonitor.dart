import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'sleepandstepsscreen.dart';

class SleepCycle extends StatefulWidget {
  @override
  _SleepCycleState createState() => _SleepCycleState();
}

class _SleepCycleState extends State<SleepCycle> {
  var stepstext = TextStyle(
      fontSize: 18,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Container(
          height: height / (812 / 60),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatatingScreen(
                        uicolor: uiSkyBlue,
                      ),
                    ),
                  );
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Steps', style: stepstext),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.insert_link,
                        size: 20,
                        color: Colors.grey[400],
                      ),
                      SizedBox(width: 4),
                      Text('Google Fit',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: height / (812 / 60),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdatatingScreen(
                                uicolor: Color(0xFFDB00DF),
                              )));
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Sleep Cycle', style: stepstext),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.insert_link,
                        size: 20,
                        color: Colors.grey[400],
                      ),
                      SizedBox(width: 4),
                      Text('Google Fit',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
