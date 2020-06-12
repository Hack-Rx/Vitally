import 'package:flutter/material.dart';
import 'package:vitally/DashBoard/Profile/profileScreen/graph.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/DashBoard/Profile/profileScreen/logoutText.dart';
import 'package:vitally/DashBoard/Profile/profileScreen/basicInfo.dart';
import 'package:vitally/DashBoard/Profile/profileScreen/banner1.dart';
import 'package:vitally/DashBoard/Profile/profileScreen/banner2.dart';
import 'package:vitally/DashBoard/Profile/profileScreen/banner4.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({@required this.uid});
  final String uid;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    BasicInfo(
                      uid: widget.uid,
                    ),
                    Banner1(
                      uid: widget.uid,
                    ),
                    Banner2(
                      uid: widget.uid,
                    ),
                    SizedBox(height: 10),
                    Banner4(
                      uid: widget.uid,
                    ),
                    GraphData(),
                    LogoutText(),
                  ],
                )),
              ),
            )
          ],
        ));
  }
}
