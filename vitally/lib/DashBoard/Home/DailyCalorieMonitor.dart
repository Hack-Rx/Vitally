import 'package:flutter/cupertino.dart';
import 'package:vitally/constants.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DailyCalorieMonitor extends StatefulWidget {
  @override
  _DailyCalorieMonitorState createState() => _DailyCalorieMonitorState();
}

class _DailyCalorieMonitorState extends State<DailyCalorieMonitor> {
  @override
  Widget build(BuildContext context) {
    String CalorieReader() {
      String consumed;
      String target;
      consumed = '1800';
      target = '2400';
      return consumed + ' / ' + target;
    }

    var DailyCalorieIntake = TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat');

    var CalorieNumbers = TextStyle(
        color: uiGreen,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');

    var RemainingCaloriesNum = TextStyle(
        color: Colors.grey[600],
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat');

    var RemainingCaloriesText = TextStyle(
        color: Colors.grey[600],
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat');

    var aDDaMeAL = TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');

    var macros = TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');

    var macroCountBig = TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');

    var macroCountSmall = TextStyle(
        color: Colors.grey[400],
        fontSize: 11,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height / 1.9,
      width: width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 154.0, left: 22, right: 22),
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
                      CalorieReader(),
                      style: CalorieNumbers,
                    ),
                    SizedBox(
                      height: height / (812 / 11),
                    ),
                    Text(
                      '600' + ' Kcal',
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
                      onPressed: () {},
                      color: uiGreen,
                      height: height / (812 / 38),
                      minWidth: width / (375 / 157),
                    )
                  ],
                ),
                CircularPercentIndicator(
                  radius: 155,
                  startAngle: 0,
                  backgroundColor: Colors.grey[300],
                  animateFromLastPercent: true,
                  animationDuration: 1500,
                  lineWidth: 17,
                  animation: true,
                  percent: 1800 / 2400,
                  center: Text(
                    '75%',
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
                      color: Color(0xFF17C6D8),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(55, 215, 234, 0.5),
                            offset: Offset(0, 4),
                            blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 0, 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'PROTEINS',
                                style: macros,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '51',
                                    style: macroCountBig,
                                  ),
                                  Text(
                                    ' /',
                                    style: macroCountSmall,
                                  ),
                                  Text(
                                    '102' + ' g',
                                    style: macroCountSmall,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        CircularStepProgressIndicator(
                          totalSteps: 102,
                          currentStep: 51,
                          stepSize: 1,
                          selectedColor: Color(0xFF77EEFC),
                          unselectedColor: Colors.grey[100],
                          padding: 0,
                          width: 30,
                          height: 30,
                          selectedStepSize: 5,
                          unselectedStepSize: 4,
                        )
                      ],
                    )),
                Container(
                    height: height / (812 / 60),
                    width: width / (375 / 100),
                    decoration: BoxDecoration(
                      color: Color(0xFF1A87FC),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(26, 135, 252, 0.5),
                            offset: Offset(0, 4),
                            blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 0, 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'CARBS',
                                style: macros,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '32',
                                    style: macroCountBig,
                                  ),
                                  Text(
                                    ' /',
                                    style: macroCountSmall,
                                  ),
                                  Text(
                                    '96' + ' g',
                                    style: macroCountSmall,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        CircularStepProgressIndicator(
                          totalSteps: 96,
                          currentStep: 32,
                          stepSize: 1,
                          selectedColor: Color(0xFF63ACF9),
                          unselectedColor: Colors.grey[100],
                          padding: 0,
                          width: 30,
                          height: 30,
                          selectedStepSize: 5,
                          unselectedStepSize: 4,
                        )
                      ],
                    )),
                Container(
                  height: height / (812 / 60),
                  width: width / (375 / 100),
                  decoration: BoxDecoration(
                    color: Color(0xFF7165E3),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(113, 101, 227, 0.5),
                          offset: Offset(0, 4),
                          blurRadius: 20)
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 15, 0, 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'FATS',
                              style: macros,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Text(
                                  '62',
                                  style: macroCountBig,
                                ),
                                Text(
                                  ' /',
                                  style: macroCountSmall,
                                ),
                                Text(
                                  '105' + ' g',
                                  style: macroCountSmall,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      CircularStepProgressIndicator(
                        totalSteps: 105,
                        currentStep: 62,
                        stepSize: 1,
                        selectedColor: Color(0xFFBF8DFE),
                        unselectedColor: Colors.grey[100],
                        padding: 0,
                        width: 30,
                        height: 30,
                        selectedStepSize: 5,
                        unselectedStepSize: 4,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
