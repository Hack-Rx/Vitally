import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitally/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitally/DashBoard/Profile/profileSettings/ProfileSettings.dart';

class BasicInfo extends StatefulWidget {
  BasicInfo({@required this.uid});
  final String uid;

  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  String email;
  void CurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    email = user.email;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    CurrentUser();
    return StreamBuilder(
        stream: Firestore.instance.collection(widget.uid).snapshots(),
        builder: (context, snapshot) {
          String name = (snapshot.data.documents[3]['userName']) == null
              ? 'null'
              : (snapshot.data.documents[3]['userName']);
          String occupation =
              (snapshot.data.documents[3]['userOccupation']) == null
                  ? 'null'
                  : (snapshot.data.documents[3]['userOccupation']);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 164,
                    width: 164,
                    child: Image.asset(
                      'assets/DP (1).png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    )),
                Container(
                  width: 164,
                  height: 164,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileSettingsPage(
                                              uid: widget.uid,
                                            )));
                              },
                              child: Icon(Icons.settings,
                                  color: Colors.grey[400], size: 25),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(name.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat',
                                    fontSize: 28)),
                            Text(
                              occupation,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontFamily: 'Montserrat',
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            print('edit');
                          },
                          child: Container(
                            height: 26,
                            width: 83,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.create,
                                  color: uiBlue,
                                  size: 15,
                                ),
                                Text(
                                  '  EDIT',
                                  style: TextStyle(
                                      color: uiBlue,
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: uiBlue),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
