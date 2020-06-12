import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/DashBoard/Home/Home.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:vitally/DashBoard/Profile/ProfilePage.dart';

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
      Text('History'),
      Text('BottomNav3'),
      ProfilePage(),
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
            icon: Icon(
              Icons.home,
              color: uiBlue,
            ),
            title: Text(
              '.',
              style: bottomNavTextStyle,
            ),
            activeIcon: Text(
              'Home',
              style: bottomNavTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.equalizer,
              color: uiBlue,
            ),
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
            icon: Icon(
              Icons.content_paste,
              color: uiBlue,
            ),
            title: Text(
              '.',
              style: bottomNavTextStyle,
            ),
            activeIcon: Text(
              '--',
              style: bottomNavTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: uiBlue,
            ),
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
