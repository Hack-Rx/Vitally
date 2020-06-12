import 'package:intl/intl.dart';
import 'package:vitally/constants.dart';
import 'package:flutter/material.dart';
import 'package:vitally/pageTransitions/pagetransition.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';
import 'package:intl/intl.dart';
import 'waterHistoryList.dart';

import 'waterDailyTarget.dart';

class WaterIntakeScreen extends StatefulWidget {
  WaterIntakeScreen({@required this.uid, @required this.WaterMeter});
  final int WaterMeter;
  final String uid;

  @override
  _WaterIntakeScreenState createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().day.toString() +
        DateTime.now().month.toString() +
        DateTime.now().year.toString();
    String time = DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString() +
        ':' +
        DateTime.now().second.toString();
    return Scaffold(
      backgroundColor: uiSkyBlue,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.create),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        EditDailyTarget(uid: widget.uid));
              })
        ],
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: uiSkyBlue,
        title: Text(
          'Today',
          style: searchbartoday,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          WaterDailyTarget(
            uid: widget.uid,
            WaterMeter: widget.WaterMeter,
          ),
          WaterHistory(uid: widget.uid),
        ],
      ),
    );
  }
}

class EditDailyTarget extends StatefulWidget {
  EditDailyTarget({@required this.uid});
  final String uid;

  @override
  _EditDailyTargetState createState() => _EditDailyTargetState();
}

class _EditDailyTargetState extends State<EditDailyTarget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController limitcontroller = TextEditingController();
    int ml;

    return ScaleTransition(
        scale: scaleAnimation,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          elevation: 0.0,
          child: SizedBox(
            height: 200,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Set daily target',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      onChanged: (value) {
                        ml = int.parse(value);
                        print(ml);
                      },
                      controller: limitcontroller,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          hintText: 'eg: 3000',
                          suffixText: 'ml',
                          suffixStyle: TextStyle(
                              color: uiSkyBlue,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat',
                              fontSize: 22)),
                    ),
                  ),
                  SizedBox(height: 22),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    height: 41,
                    minWidth: 88,
                    onPressed: () {
                      print(ml);
                      setState(() {
                        userDataHelpUsForm(uid: widget.uid)
                            .DailyWaterIntake(ml);
                        Navigator.pop(context);
                      });
                    },
                    color: uiSkyBlue,
                    child: Text('OK',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
