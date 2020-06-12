import 'package:flutter/cupertino.dart';
import 'package:vitally/constants.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitally/DashBoard/Home/CalorieMeterScreens/SearchScreen/addMeal.dart';

class DailyCalorieMonitor extends StatefulWidget {
  DailyCalorieMonitor({@required this.uid});
  final String uid;

  @override
  _DailyCalorieMonitorState createState() => _DailyCalorieMonitorState();
}

class _DailyCalorieMonitorState extends State<DailyCalorieMonitor> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder(
        stream: Firestore.instance.collection(widget.uid).snapshots(),
        builder: (context, snapshot) {
          int dailyCal = (snapshot.data.documents[2]['DailyCal']) == null
              ? 0
              : (snapshot.data.documents[2]['DailyCal']);

          int protienDaily = ((0.175 * dailyCal) ~/ 4);
          int fatsDaily = ((0.35 * dailyCal) ~/ 9);
          int dailyCarbs = ((0.50 * dailyCal) ~/ 4);

          String today = DateTime.now().day.toString() +
              DateTime.now().month.toString() +
              DateTime.now().year.toString();

          if (!snapshot.hasData) return Text('Loading');
          return StreamBuilder(
              stream: Firestore.instance
                  .collection(widget.uid)
                  .document('userData')
                  .collection('$today')
                  .snapshots(),
              builder: (context, snapshot) {
                int calConsumed = (snapshot.data.documents[0]
                            ['consumedCalories']) ==
                        null
                    ? 0
                    : (snapshot.data.documents[0]['consumedCalories']).toInt();
                int carbs = (snapshot.data.documents[0]['dailyCarbs']) == null
                    ? 0
                    : (snapshot.data.documents[0]['dailyCarbs']).toInt();
                int fats = (snapshot.data.documents[0]['dailyFat']) == null
                    ? 0
                    : (snapshot.data.documents[0]['dailyFat']).toInt();
                int protein =
                    (snapshot.data.documents[0]['dailyProtein']) == null
                        ? 0
                        : (snapshot.data.documents[0]['dailyProtein']).toInt();
                double percentage = (calConsumed / dailyCal) * 100;
                int perc = percentage.toInt();
                return Container(
                  height: height / 1.85,
                  width: width,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 144.0, left: 22, right: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Daily Calorie Intake',
                                  style: DailyCalorieIntake,
                                ),
                                SizedBox(
                                  height: height / (812 / 13.01),
                                ),
                                Text(
                                  calConsumed.toString() +
                                      ' / ' +
                                      dailyCal.toString(),
                                  style: CalorieNumbers,
                                ),
                                SizedBox(
                                  height: height / (812 / 11),
                                ),
                                Text(
                                  (dailyCal - calConsumed).toString() + ' Kcal',
                                  style: RemainingCaloriesNum,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'remaining to consume',
                                  style: RemainingCaloriesText,
                                ),
                                SizedBox(
                                  height: height / (812 / 16),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Text(
                                    'ADD A MEAL',
                                    style: aDDaMeAL,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddMealPage(
                                            uid: widget.uid,
                                            caloriesConsumed:
                                                calConsumed == null
                                                    ? 0
                                                    : calConsumed,
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  color: uiGreen,
                                  height: height / (812 / 38),
                                  minWidth: width / (375 / 157),
                                )
                              ],
                            ),
                            CircularPercentIndicator(
                              radius: 155,
                              startAngle: 0,
                              backgroundColor:
                                  perc >= 100 ? Colors.red : Colors.grey[300],
                              animateFromLastPercent: true,
                              animationDuration: 1500,
                              lineWidth: 17,
                              animation: true,
                              percent:
                                  perc >= 100 ? 0 : (perc / 100).toDouble(),
                              center: Text(
                                perc.toString() + '%',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontFamily: 'Montserrat',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Color(0xFF00E190),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height / (812 / 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                height: height / (812 / 60),
                                width: width / (375 / 100),
                                decoration: BoxDecoration(
                                  color: protein > protienDaily
                                      ? Colors.redAccent
                                      : Color(0xFF17C6D8),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(55, 215, 234, 0.5),
                                        offset: Offset(0, 4),
                                        blurRadius: 20)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 15, 0, 6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'PROTEINS',
                                            style: macros,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                protein.toString(),
                                                style: macroCountBig,
                                              ),
                                              Text(
                                                ' /',
                                                style: macroCountSmall,
                                              ),
                                              Text(
                                                protienDaily.toString() + ' g',
                                                style: macroCountSmall,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    CircularStepProgressIndicator(
                                      totalSteps: protienDaily,
                                      currentStep: protein,
                                      stepSize: 1,
                                      selectedColor: Colors.grey[100],
                                      unselectedColor: Color(0xFF77EEFC),
                                      padding: 0,
                                      width: 30,
                                      height: 30,
                                      selectedStepSize: 4.5,
                                      unselectedStepSize: 4,
                                    )
                                  ],
                                )),
                            Container(
                                height: height / (812 / 60),
                                width: width / (375 / 100),
                                decoration: BoxDecoration(
                                  color: carbs > dailyCarbs
                                      ? Colors.redAccent
                                      : Color(0xFF1A87FC),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(26, 135, 252, 0.5),
                                        offset: Offset(0, 4),
                                        blurRadius: 20)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 15, 0, 6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'CARBS',
                                            style: macros,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                carbs.toString(),
                                                style: macroCountBig,
                                              ),
                                              Text(
                                                ' /',
                                                style: macroCountSmall,
                                              ),
                                              Text(
                                                dailyCarbs.toString() + ' g',
                                                style: macroCountSmall,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    CircularStepProgressIndicator(
                                      totalSteps: dailyCarbs,
                                      currentStep: carbs,
                                      stepSize: 1,
                                      selectedColor: Colors.grey[100],
                                      unselectedColor: Color(0xFF63ACF9),
                                      padding: 0,
                                      width: 30,
                                      height: 30,
                                      selectedStepSize: 4.5,
                                      unselectedStepSize: 4,
                                    )
                                  ],
                                )),
                            Container(
                              height: height / (812 / 60),
                              width: width / (375 / 100),
                              decoration: BoxDecoration(
                                color: fats > fatsDaily
                                    ? Colors.redAccent
                                    : Color(0xFF7165E3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(113, 101, 227, 0.5),
                                      offset: Offset(0, 4),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 15, 0, 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'FATS',
                                          style: macros,
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              fats.toString(),
                                              style: macroCountBig,
                                            ),
                                            Text(
                                              ' /',
                                              style: macroCountSmall,
                                            ),
                                            Text(
                                              fatsDaily.toString() + ' g',
                                              style: macroCountSmall,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  CircularStepProgressIndicator(
                                    totalSteps: fatsDaily,
                                    currentStep: fats,
                                    stepSize: 1,
                                    selectedColor: Colors.grey[100],
                                    unselectedColor: Color(0xFFBF8DFE),
                                    padding: 0,
                                    width: 30,
                                    height: 30,
                                    selectedStepSize: 4.5,
                                    unselectedStepSize: 4,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5)
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
