import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Banner2 extends StatefulWidget {
  Banner2({@required this.uid});
  final String uid;
  @override
  _Banner2State createState() => _Banner2State();
}

class _Banner2State extends State<Banner2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: Firestore.instance.collection(widget.uid).snapshots(),
        builder: (context, snapshot) {
          var targetweight =
              (snapshot.data.documents[0]['TargetWeight']) == null
                  ? 0
                  : (snapshot.data.documents[0]['TargetWeight']);

          var duration = (snapshot.data.documents[0]['Duration']) == null
              ? 0
              : (snapshot.data.documents[0]['Duration']);

          int goal = (snapshot.data.documents[0]['Goal']) == null
              ? 0
              : (snapshot.data.documents[0]['Goal']);

          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: width / (375 / 331),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19.0, vertical: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Goal',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(30, 3, 227, 191),
                              borderRadius: BorderRadius.circular(6)),
                          height: 25,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Center(
                              child: Text(
                                  goal == 1
                                      ? 'Be Healthier'
                                      : goal == 2
                                          ? 'Lose Weight'
                                          : goal == 3 ? 'Gain Weight' : 'null',
                                  style: TextStyle(
                                      color: uiGreen,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat',
                                      fontSize: 11)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 1,
                        width: width / (375 / 297),
                        color: Colors.grey[300]),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Target Weight',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 5.5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  targetweight.toInt().toString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      color: uiGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.5),
                                  child: Text(
                                    '  kgs',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Montserrat',
                                        color: uiGreen,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Target Duration',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(height: 5.5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    duration.toInt().toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Montserrat',
                                        color: uiGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.5),
                                    child: Text(
                                      '  weeks',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Montserrat',
                                          color: uiGreen,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                        ),
                      ],
                    ),
                    SizedBox(height: 3)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
