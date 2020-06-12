import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';
import 'profileSettingScreens/personalInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vitally/userRegistration/registration2.dart';
import 'profileSettingScreens/AboutUs.dart';

class ProfileSettingsPage extends StatefulWidget {
  ProfileSettingsPage({
    @required this.uid,
  });

  final String uid;

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool values = true;
  String email;
  void CurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    email = user.email;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final _auth = FirebaseAuth.instance;
    CurrentUser();

    return Scaffold(
        backgroundColor: uiGreen,
        body: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Expanded(
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            child: Row(
                          children: <Widget>[
                            Icon(Icons.arrow_back_ios,
                                color: uiGreen, size: 30),
                            Text(' Profile',
                                style: TextStyle(
                                    color: uiGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat'))
                          ],
                        )),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Settings',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat')),
                      ),
                      SizedBox(height: 13),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        width: width / (375 / 331),
                        height: height / (812 / 136),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Personal Info',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PersonalInfo(
                                                    uid: widget.uid,
                                                  )));
                                    },
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: uiGreen, size: 20),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                  width: width / (375 / 275),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 1.5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Customize Goal',
                                      style: TextStyle(
                                          color: uiGreen,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('Customize Goal ');
                                        Toast.show(
                                            'Feature Not Available Right Now',
                                            context,
                                            duration: Toast.LENGTH_LONG,
                                            gravity: Toast.BOTTOM,
                                            textColor: Colors.black,
                                            backgroundColor: Colors.grey[300]);
                                      },
                                      child: Icon(Icons.arrow_forward_ios,
                                          color: uiGreen, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                  width: width / (375 / 275),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Change password',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await _auth
                                          .sendPasswordResetEmail(email: email)
                                          .whenComplete(
                                            () => Toast.show(
                                                'Please check your registered Email',
                                                context,
                                                duration: Toast.LENGTH_LONG,
                                                gravity: Toast.BOTTOM,
                                                textColor: Colors.black,
                                                backgroundColor:
                                                    Colors.grey[300]),
                                          );
                                    },
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: uiGreen, size: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 17),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        width: width / (375 / 331),
                        height: height / (812 / 56),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Notifications',
                                style: TextStyle(
                                    color: uiGreen,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat'),
                              ),
                              CupertinoSwitch(
                                value: values,
                                activeColor: uiGreen,
                                dragStartBehavior: DragStartBehavior.start,
                                onChanged: (v) {
                                  setState(() {
                                    values = v;
                                  });
                                  Toast.show(
                                      values
                                          ? 'Notifications Enabled'
                                          : 'Notifications Disabled',
                                      context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM,
                                      textColor: Colors.black,
                                      backgroundColor: Colors.grey[300]);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        width: width / (375 / 331),
                        height: height / (812 / 137),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Request my health log',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      userDataHelpUsForm(uid: widget.uid)
                                          .healthData(1, email)
                                          .whenComplete(
                                            () => Toast.show(
                                                'Your Nutrition Report will be sent to Registered Email shortly',
                                                context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM,
                                                textColor: Colors.black,
                                                backgroundColor:
                                                    Colors.grey[300]),
                                          );
                                    },
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: uiGreen, size: 20),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                  width: width / (375 / 275),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Configure Apple Health',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Toast.show(
                                          'Future Scope: Our Team is Updating',
                                          context,
                                          duration: Toast.LENGTH_SHORT,
                                          gravity: Toast.BOTTOM,
                                          textColor: Colors.black,
                                          backgroundColor: Colors.grey[300]);
                                    },
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: uiGreen, size: 20),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                  width: width / (375 / 275),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Configure Google Fit',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: uiGreen, size: 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        width: width / (375 / 331),
                        height: height / (812 / 175),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'FAQ',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: uiGreen, size: 20),
                                ],
                              ),
                              Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                  width: width / (375 / 275),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'About us',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AboutUs()));
                                    },
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: uiGreen, size: 20),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                  width: width / (375 / 275),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Privacy policies',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: uiGreen, size: 20),
                                ],
                              ),
                              Center(
                                child: Container(
                                  color: Colors.grey[300],
                                  height: 0.5,
                                  width: width / (375 / 275),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Terms and conditions',
                                    style: TextStyle(
                                        color: uiGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: uiGreen, size: 20),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            )
          ],
        ));
    ;
  }
}
