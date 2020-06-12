import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Banner1 extends StatefulWidget {
  Banner1({@required this.uid});
  final String uid;
  @override
  _Banner1State createState() => _Banner1State();
}

class _Banner1State extends State<Banner1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: Firestore.instance.collection(widget.uid).snapshots(),
        builder: (context, snapshot) {
          var age = (snapshot.data.documents[3]['userAge']) == null
              ? 'null'
              : (snapshot.data.documents[3]['userAge']);
          var userheight = (snapshot.data.documents[3]['userHeight']) == null
              ? 'null'
              : (snapshot.data.documents[3]['userHeight']);
          var userWeight = (snapshot.data.documents[3]['userWeight']) == null
              ? 'null'
              : (snapshot.data.documents[3]['userWeight']);

          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: height / (812 / 72),
              width: width / (375 / 331),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(13)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Montserrat',
                              color: uiGreen,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1.0),
                              child: Text(
                                ' yrs',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height / (812 / 28),
                    width: 1,
                    color: Colors.grey[400],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Montserrat',
                              color: uiGreen,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '$userWeight',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1.0),
                              child: Text(
                                ' kg',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height / (812 / 28),
                    width: 1,
                    color: Colors.grey[400],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Montserrat',
                              color: uiGreen,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '$userheight',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1.0),
                              child: Text(
                                ' cms',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
