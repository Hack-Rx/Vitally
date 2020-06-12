import 'package:flutter/material.dart';
import 'pagetransition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'userdataformservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'finalOnboarding.dart';
import 'registration1.dart';

class Registration3 extends StatefulWidget {
  final goalValue;
  final dailyCalorie1;
  final height;
  final weight;
  Registration3({this.goalValue, this.height, this.dailyCalorie1, this.weight});

  @override
  _Registration3State createState() => _Registration3State();
}

class _Registration3State extends State<Registration3> {
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

  var _autoValidate = false;
  final _formkeyGoal = GlobalKey<FormState>();

  double targetWeight;
  double weeks;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 100),
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
                      width: phoneWidth / 3.409,
                      child: Image.asset('assets/3.png')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SingleChildScrollView(
                  child: SizedBox(
                      height: phoneHeight / 2.9,
                      width: phoneWidth / 1.34,
                      child: Form(
                          autovalidate: _autoValidate,
                          key: _formkeyGoal,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Set Your Taget Weight',
                                      labelStyle: labeltxt,
                                      suffix: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: OutlineButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  Choose_2Dialog(
                                                title: 'Choose units',
                                                choice1: 'kg',
                                                choice2: 'lbs',
                                              ),
                                            );
                                          },
                                          padding: EdgeInsets.all(0),
                                          disabledBorderColor:
                                              Color(0xFF00CDAC),
                                          child: Text(
                                            'kg',
                                            style: TextStyle(
                                                color: Color(0xFF00CDAC),
                                                fontSize: 10,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                    validator: (weight) {
                                      return weight.length == 0
                                          ? 'Weight cannot be Zero'
                                          : null;
                                    },
                                    onSaved: (String weight) {
                                      targetWeight = double.parse(weight);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Set Your Taget Duration',
                                      labelStyle: labeltxt,
                                      suffix: SizedBox(
                                        height: 24,
                                        width: 46,
                                        child: OutlineButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  Choose_2Dialog(
                                                title: 'Choose units',
                                                choice1: 'weeks',
                                                choice2: 'Months',
                                              ),
                                            );
                                          },
                                          padding: EdgeInsets.all(0),
                                          disabledBorderColor:
                                              Color(0xFF00CDAC),
                                          child: Text(
                                            'weeks',
                                            style: TextStyle(
                                                color: Color(0xFF00CDAC),
                                                fontSize: 10,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                    validator: (weight) {
                                      return weight.length == 0
                                          ? 'Duration cannot be Empty'
                                          : null;
                                    },
                                    onSaved: (String weight) {
                                      weeks = double.parse(weight);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ),
              ),
              MaterialButton(
                elevation: 0.5,
                child: Text(
                  'Save',
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
                  autoval();
                  print(registereduser.uid);
                },
                height: phoneHeight / 13.54,
                minWidth: phoneWidth / 1.205,
                color: uiGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  double dailycal(int goal) {
    double dailycalo;
    if (goal == 1) {
      dailycalo = widget.dailyCalorie1;
    } else if (goal == 2) {
      double diff = (widget.weight - targetWeight) / (weeks * 7);
      double calreq2 = diff * 7777;
      dailycalo = (widget.dailyCalorie1 - calreq2);
    } else if (goal == 2) {
      double diff2 = (targetWeight - widget.weight) / (weeks * 7);
      double calreq3 = diff2 * 7777;
      dailycalo = (widget.dailyCalorie1 + calreq3);
    } else
      dailycalo = widget.dailyCalorie1;
    return dailycalo;
  }

  double newBMI() {
    return targetWeight / ((widget.height / 100) * (widget.height / 100));
  }

  void autoval() {
    _formkeyGoal.currentState.validate() ? success() : _autoValidate = true;
  }

  void success() async {
    _formkeyGoal.currentState.save();

    try {
      await userDataHelpUsForm(uid: registereduser.uid)
          .updategoalData(targetWeight, weeks, widget.goalValue)
          .whenComplete(
            () => Navigator.push(
              context,
              ScaleRoute(
                page: LastOnboarding(
                  goalValue: widget.goalValue,
                  bmiGoal: newBMI(),
                  goalDuration: weeks,
                  CurrentWeight: widget.weight,
                  weeklygoal: widget.goalValue == 2
                      ? (widget.weight - targetWeight) / 7
                      : (targetWeight - widget.weight) / 7,
                  dailyCalorieRequirement: dailycal(widget.goalValue),
                ),
              ),
            ),
          );
      print('succes');
    } catch (e) {
      print(e);
    }
  }
}
