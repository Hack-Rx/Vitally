import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';

class HealthLogs extends StatefulWidget {
  HealthLogs({@required this.uid});

  final String uid;
  @override
  _HealthLogsState createState() => _HealthLogsState();
}

class _HealthLogsState extends State<HealthLogs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: uiOrange,
      appBar: AppBar(
        backgroundColor: uiOrange,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Container(
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEF),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            topLeft: Radius.circular(35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height / (812 / 186),
              width: width / (375 / 347),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                    child: Container(
                      height: height / (812 / 143),
                      width: width / (375 / 331),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Talk with our',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                      color: uiGreen),
                                ),
                                Text(
                                  'nutritionist',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                      color: uiGreen),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Connect with a',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black),
                                ),
                                Text(
                                  'nutritionist nearby and',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black),
                                ),
                                Text(
                                  'get guidance',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 22),
                        Container(
                          height: height / (812 / 186),
                          width: width / (375 / 186),
                          child: Image.asset('assets/nutritionist.png',
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: height / (812 / 148),
              width: width / (375 / 331),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: height / (812 / 147),
                          width: width / (375 / 331),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Track your',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          color: uiGreen),
                                    ),
                                    Text(
                                      'calories',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          color: uiGreen),
                                    ),
                                    Text(
                                      'burned',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          color: uiGreen),
                                    ),
                                  ],
                                ),
                                MaterialButton(
                                  elevation: 0.2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () {},
                                  color: uiBlue,
                                  height: 29,
                                  minWidth: 112,
                                  child: Text(
                                    '+ ADD ACTIVITY',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 20),
                        Container(
                          height: height / (812 / 143),
                          width: width / (375 / 143),
                          child: Image.asset('assets/Workout-pana 1.png',
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13), color: Colors.white),
              height: height / (812 / 143),
              width: width / (375 / 319),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Request for',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: uiGreen),
                            ),
                            Text(
                              'your monthly',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: uiGreen),
                            ),
                            Text(
                              'health report',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: uiGreen),
                            ),
                          ],
                        ),
                        MaterialButton(
                          elevation: 0.2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {},
                          color: uiBlue,
                          height: 29,
                          minWidth: 86,
                          child: Text(
                            'REQUEST',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                        height: 142,
                        width: 142,
                        child: Image.asset('assets/Report-amico 1.png',
                            fit: BoxFit.fill)),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Activity plans ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            fontFamily: 'Montserrat',
                            color: Colors.black),
                      ),
                      Container(
                        height: 23,
                        width: 64,
                        decoration: BoxDecoration(
                            color: Color(0xFFFDDABA),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            'Premium',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                fontFamily: 'Montserrat',
                                color: uiOrange),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: uiBlue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Expanded(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 22),
                      Container(
                          height: 103,
                          width: 267,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(19.0),
                                child: Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.whatshot,
                                            color: uiOrange, size: 15),
                                        Icon(Icons.whatshot,
                                            color: Colors.grey, size: 15),
                                        Icon(Icons.whatshot,
                                            color: Colors.grey, size: 15),
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Text('Yoga',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 7),
                                    Text('Beginner - 12 mins',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontFamily: 'Montserrat',
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal))
                                  ],
                                )),
                              ),
                              Container(
                                  child: Image.asset(
                                      'assets/Meditation-bro 1.png'))
                            ],
                          )),
                      SizedBox(width: 13),
                      Container(
                          height: 103,
                          width: 267,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(19.0),
                                child: Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.whatshot,
                                            color: uiOrange, size: 15),
                                        Icon(Icons.whatshot,
                                            color: uiOrange, size: 15),
                                        Icon(Icons.whatshot,
                                            color: Colors.grey, size: 15),
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Text('Abs',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 7),
                                    Text('Intermediate - 12 mins',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontFamily: 'Montserrat',
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal))
                                  ],
                                )),
                              ),
                              Container(
                                  child: Image.asset(
                                      'assets/Meditation-bro 1.png'))
                            ],
                          )),
                      SizedBox(width: 13),
                      Container(
                          height: 103,
                          width: 267,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(19.0),
                                child: Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.whatshot,
                                            color: uiOrange, size: 15),
                                        Icon(Icons.whatshot,
                                            color: uiOrange, size: 15),
                                        Icon(Icons.whatshot,
                                            color: uiOrange, size: 15),
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Text('HIIT',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 7),
                                    Text('Advanced - 15 mins',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontFamily: 'Montserrat',
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal))
                                  ],
                                )),
                              ),
                              Container(
                                  child:
                                      Image.asset('assets/Workout-amico 1.png'))
                            ],
                          )),
                      SizedBox(width: 13),
                    ],
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
