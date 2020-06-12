import 'package:flutter/material.dart';
import 'package:vitally/DashBoard/DashBoardLanding.dart';
import 'package:vitally/Login_SignUp/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  FirebaseUser registereduser;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    registereduser = user;
  }

  @override
  Widget build(BuildContext context) {
    if (registereduser != null)
      return LandingDashBoard(uid: registereduser.uid);
    else
      return UserLoginPage();
  }
}
