import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitally/pageTransitions/pagetransition.dart';
import 'package:vitally/Login_SignUp/login.dart';
import 'package:vitally/constants.dart';

class LogoutText extends StatefulWidget {
  @override
  _LogoutTextState createState() => _LogoutTextState();
}

class _LogoutTextState extends State<LogoutText> {
  bool _spinner = false;

  final _auth = FirebaseAuth.instance;

  final _googleSignIn = GoogleSignIn();

  void singOutGoogle() async {
    setState(() {
      _spinner = true;
    });
    await _auth.signOut();
    await _googleSignIn.signOut().whenComplete(() => _spinner = false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserLoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            singOutGoogle();
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'LOGOUT',
                  style: TextStyle(
                      color: uiBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                ),
                Container(color: uiBlue, height: 1, width: 60),
              ]),
        ));
  }
}
