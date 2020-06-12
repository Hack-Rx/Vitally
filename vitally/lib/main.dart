import 'package:flutter/material.dart';
import 'package:vitally/onBoarding/onboarding.dart';
import 'Login_SignUp/login.dart';
import 'package:vitally/DashBoard/DashBoardLanding.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
//This is the code for onboarding screens to appear only once
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt(
      "initScreen", 1); //TODO: Change the initScreen Value to 1 later
  print('initScreen $initScreen');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00CDAC),
      ),
      home: (initScreen == 0 || initScreen == null)
          ? Onboarding()
          : LandingDashBoard(),
    );
  }
}
