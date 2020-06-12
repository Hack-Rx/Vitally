import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'waterIntakeScreens/WaterIntakeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';
import 'package:intl/intl.dart';

class WaterIntake extends StatefulWidget {
  WaterIntake({@required this.uid});
  final String uid;

  @override
  _WaterIntakeState createState() => _WaterIntakeState();
}

DateTime now = DateTime.now();

class _WaterIntakeState extends State<WaterIntake> {
  int noofglasses = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String today = DateTime.now().day.toString() +
        DateTime.now().month.toString() +
        DateTime.now().year.toString();
    String time = DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString() +
        ':' +
        DateTime.now().second.toString();

    int waterIn = 250;
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
          if (!snapshot.hasData) return Text('Loading');
          return StreamBuilder(
              stream: stream2,
              builder: (context, snapshot) {
                int watermeter =
                    (snapshot.data.documents[1]['consumedQuantity']) == null
                        ? 0
                        : (snapshot.data.documents[1]['consumedQuantity']);

                return Container(
                  width: double.maxFinite,
//      height: height / (812 / 235),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                'Water intake',
                                style: waterIntake,
                              ),
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WaterIntakeScreen(
                                        uid: widget.uid,
                                        WaterMeter: watermeter,
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                child: Icon(Icons.settings,
                                    color: Colors.grey[600], size: 20),
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WaterIntakeScreen(
                                          uid: widget.uid,
                                          WaterMeter: watermeter,
                                        ),
                                      ),
                                    );
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / (812 / 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          dailyWater.toString() + 'ml',
                                          style: scale,
                                        ),
                                        Text(
                                          (dailyWater / 2).toString() + 'ml',
                                          style: scale,
                                        ),
                                        Text(
                                          '0 ml',
                                          style: scale,
                                        ),
                                      ],
                                    )),
                                Container(
                                  height: 150,
                                  child: Image.asset('assets/Lines.png'),
                                ),
                                Container(
                                  height: 150,
                                  width: 65,
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: LiquidLinearProgressIndicator(
                                    borderColor: Color(0xFF0270C0),
                                    borderWidth: 2.5,
                                    borderRadius: 44,
                                    value: watermeter.toDouble() / dailyWater,
                                    valueColor: watermeter < dailyWater
                                        ? AlwaysStoppedAnimation(
                                            Color(0xFF55D6FF))
                                        : AlwaysStoppedAnimation(
                                            Colors.redAccent),
                                    backgroundColor: Color(0xFF0270C0),
                                    direction: Axis.vertical,
                                    center: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('$watermeter',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white)),
                                        Text(
                                          'ml',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Montserrat',
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width / (375 / 60),
                            ),
                            Container(
                                width: 165,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                              color: noofglasses > 1
                                                  ? uiGreen
                                                  : Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Icon(Icons.remove,
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            if (noofglasses > 0)
                                              setState(() {
                                                noofglasses--;
                                                print(noofglasses);
                                              });
                                          },
                                        ),
                                        Container(
                                          width: 67,
                                          height: 67,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        25, 0, 0, 0),
                                                    blurRadius: 20,
                                                    offset: Offset(0.4, 1.4))
                                              ]),
                                          child: Image.asset(
                                              'assets/Glass (1).png'),
                                        ),
                                        GestureDetector(
                                            child: Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                color: uiGreen,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                noofglasses = noofglasses + 1;
                                                print(noofglasses);
                                              });
                                            }),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '$noofglasses' + 'x',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          '250 ml',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        )
                                      ],
                                    ),
                                    MaterialButton(
                                      child: Text(
                                        'Add Drink',
                                        style: addaDrink,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      height: 40,
                                      minWidth: 160,
                                      color: uiGreen,
                                      onPressed: () {
                                        setState(() {
                                          watermeter = watermeter +
                                              noofglasses * waterIn;

                                          userDataHelpUsForm(uid: widget.uid)
                                              .WaterLog(
                                                  noofglasses * waterIn,
                                                  dailyWater - watermeter,
                                                  time);

                                          noofglasses = 1;
                                        });
                                        userDataHelpUsForm(uid: widget.uid)
                                            .updateWaterIntake(watermeter);
                                      },
                                    )
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(
                          height: height / (812 / 29),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
