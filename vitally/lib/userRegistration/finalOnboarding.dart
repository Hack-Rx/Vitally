import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitally/DashBoard/DashBoardLanding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitally/pageTransitions/pagetransition.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';

const headertext = TextStyle(
    fontSize: 16,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: Colors.black);
const NumberText = TextStyle(
    fontSize: 26,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    color: uiGreen);

class LastOnboarding extends StatefulWidget {
  final double bmiGoal;
  final double goalDuration;
  final double dailyCalorieRequirement;
  final double CurrentWeight;
  final double weeklygoal;
  final int goalValue;

  LastOnboarding(
      {this.dailyCalorieRequirement,
      this.bmiGoal,
      this.goalDuration,
      this.CurrentWeight,
      this.weeklygoal,
      this.goalValue});

  @override
  _LastOnboardingState createState() => _LastOnboardingState();
}

class _LastOnboardingState extends State<LastOnboarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  final _auth = FirebaseAuth.instance;
  FirebaseUser registereduser;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    registereduser = user;
  }

  bool _spinner = false;
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Your Calorie",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          'Goal',
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
                        width: phoneWidth / 3.409,
                        child: Image.asset('assets/jogging.png')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 30, 25, 30),
                  child: SizedBox(
                    height: phoneHeight / 2.9,
                    width: phoneWidth / 1.171,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Daily Calorie Requirement',
                                    style: headertext),
                                Text(
                                  widget.dailyCalorieRequirement
                                          .toStringAsPrecision(6) +
                                      ' kCal',
                                  style: NumberText,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Current Weight', style: headertext),
                                  Text(
                                    widget.CurrentWeight.toString() + ' Kg',
                                    style: NumberText,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Goal duration', style: headertext),
                                  Text(
                                    widget.goalDuration == 0
                                        ? 'Be Healthier'
                                        : widget.goalDuration.toString() +
                                            ' Weeks',
                                    style: NumberText,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Weekly Goal', style: headertext),
                                  Text(
                                    widget.weeklygoal == 0
                                        ? 'Be Healthier'
                                        : widget.goalValue == 2
                                            ? '-'
                                            : '+' +
                                                widget.weeklygoal
                                                    .toStringAsPrecision(2) +
                                                ' kg',
                                    style: NumberText,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('BMI goal', style: headertext),
                                  Text(
                                    widget.bmiGoal == 0
                                        ? 'Be Healthier'
                                        : widget.bmiGoal
                                                .toStringAsPrecision(2) +
                                            ' kg/m\u00b2',
                                    style: NumberText,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  elevation: 0.5,
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onPressed: () async {
                    try {
                      _spinner = true;
                      await userDataHelpUsForm(uid: registereduser.uid)
                          .updatetargetData(
                              widget.dailyCalorieRequirement.toInt(),
                              widget.bmiGoal,
                              widget.weeklygoal.toStringAsPrecision(2))
                          .whenComplete(() => _spinner = false);
                      Navigator.push(
                        context,
                        EnterExitRoute(
                            enterPage:
                                LandingDashBoard(uid: registereduser.uid),
                            exitPage: LastOnboarding()),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  height: phoneHeight / 13.54,
                  minWidth: phoneWidth / 1.205,
                  color: uiGreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
