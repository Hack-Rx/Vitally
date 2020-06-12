import 'package:flutter/material.dart';
import 'package:vitally/GoalPage2.dart';
import 'pagetransition.dart';
import 'constants.dart';
import 'GoalPage2.dart';
import 'finalOnboarding.dart';

class Registration2 extends StatefulWidget {
  @override
  _Registration2State createState() => _Registration2State();

  Registration2({this.dailycalorierequirement1, this.height, this.weight});

  final double dailycalorierequirement1;
  final double height;
  final double weight;
}

class _Registration2State extends State<Registration2> {
  bool pressAttention1 = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;

  int goal = 0;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "What's your",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      'Goal?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                    )
                  ],
                ),
                SizedBox(
                    height: phoneHeight / 6.77,
                    width: phoneWidth / 3.41,
                    child: Image.asset('assets/3.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: phoneHeight / 2.9,
                  width: phoneWidth / 1.34,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: phoneWidth / 1.404,
                        child: RaisedButton(
                          elevation: 0.0,
                          onPressed: () {
                            setState(() {
                              pressAttention1 = !pressAttention1;
                              pressAttention2 = false;
                              pressAttention3 = false;
                              goal = 1;
                            });
                          },
                          color: pressAttention1 ? uiGreen : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: pressAttention1 ? uiGreen : uiGrey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Be Healthier',
                                  style: TextStyle(
                                      color: pressAttention1
                                          ? Colors.white
                                          : uiGrey,
                                      fontSize: 25,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Eat and train for optimum health        ',
                                  style: TextStyle(
                                      color: pressAttention1
                                          ? Colors.white
                                          : uiGrey,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: phoneWidth / 1.404,
                        child: RaisedButton(
                          elevation: 0.0,
                          onPressed: () {
                            setState(() {
                              pressAttention2 = !pressAttention2;
                              pressAttention1 = false;
                              pressAttention3 = false;
                              goal = 2;
                              print('$pressAttention2');
                            });
                          },
                          color: pressAttention2 ? uiGreen : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: pressAttention2 ? uiGreen : uiGrey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Lose Weight',
                                  style: TextStyle(
                                      color: pressAttention2
                                          ? Colors.white
                                          : uiGrey,
                                      fontSize: 25,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Get leaner and increase your Stamina',
                                  style: TextStyle(
                                      color: pressAttention2
                                          ? Colors.white
                                          : uiGrey,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        //padding: EdgeInsets.all(0),
                        minWidth: phoneWidth / 1.404,
                        child: RaisedButton(
                          elevation: 0.0,
                          onPressed: () {
                            setState(() {
                              pressAttention3 = !pressAttention3;
                              pressAttention1 = false;
                              pressAttention2 = false;
                              goal = 3;
                              print('$pressAttention3');
                            });
                          },
                          color: pressAttention3 ? uiGreen : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: pressAttention3 ? uiGreen : uiGrey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Gain Weight',
                                  style: TextStyle(
                                      color: pressAttention3
                                          ? Colors.white
                                          : uiGrey,
                                      fontSize: 25,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Build Muscle Strength                             ',
                                  style: TextStyle(
                                      color: pressAttention3
                                          ? Colors.white
                                          : uiGrey,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
              elevation: 0.5,
              child: Text(
                'NEXT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onPressed: () {
                goal > 0
                    ? goal == 1
                        ? Navigator.push(
                            context,
                            EnterExitRoute(
                                exitPage: Registration2(),
                                enterPage: LastOnboarding(
                                  dailyCalorieRequirement:
                                      widget.dailycalorierequirement1,
                                  CurrentWeight: widget.weight,
                                  goalDuration: 0,
                                  weeklygoal: 0,
                                  bmiGoal: 0,
                                )),
                          )
                        : Navigator.push(
                            context,
                            EnterExitRoute(
                              exitPage: Registration2(),
                              enterPage: Registration3(
                                goalValue: goal,
                                dailyCalorie1: widget.dailycalorierequirement1,
                                height: widget.height,
                                weight: widget.weight,
                              ),
                            ),
                          )
                    : null;
                //Navigator push to next page
                print('object');
              },
              height: phoneHeight / 13.54,
              minWidth: phoneWidth / 1.205,
              color: goal > 0 ? uiGreen : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
