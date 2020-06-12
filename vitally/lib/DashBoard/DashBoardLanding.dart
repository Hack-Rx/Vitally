import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/DashBoard/Home/Home.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:vitally/DashBoard/Profile/ProfilePage.dart';
import 'package:vitally/DashBoard/BotNav_3/HealthLog.dart';
import 'package:vitally/DashBoard/History/history.dart';

var bottomNavTextStyle = TextStyle(
    color: uiBlue,
    fontSize: 15,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500);

class LandingDashBoard extends StatefulWidget {
  LandingDashBoard({@required this.uid});
  final String uid;

  @override
  _LandingDashBoardState createState() => _LandingDashBoardState();
}

class _LandingDashBoardState extends State<LandingDashBoard> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final String useruid = widget.uid;
    final _pages = [
      HomePage(
        uid: useruid,
      ),
      History(uid: widget.uid),
      HealthLogs(uid: widget.uid),
      ProfilePage(
        uid: widget.uid,
      ),
    ];
    bool _spinner = false;
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: ModalProgressHUD(
          inAsyncCall: _spinner, child: Center(child: _pages[_selectedPage])),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
          _spinner = false;
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
                height: 27, width: 28, child: Image.asset('assets/Home.png')),
            title: Text(
              '.',
              style: bottomNavTextStyle,
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Home',
                  style: bottomNavTextStyle,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 25, width: 25, child: Image.asset('assets/Stats.png')),
            title: Text(
              '.',
              style: bottomNavTextStyle,
            ),
            activeIcon: Text(
              'History',
              style: bottomNavTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 25,
                width: 25,
                child: Image.asset('assets/Clipboard (1).png')),
            title: Text(
              '.',
              style: bottomNavTextStyle,
            ),
            activeIcon: Text(
              'Health Log',
              style: bottomNavTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 27,
                width: 27,
                child: Image.asset('assets/Profile.png')),
            title: Text(
              '.',
              style: bottomNavTextStyle,
            ),
            activeIcon: Text(
              'Profile',
              style: bottomNavTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
