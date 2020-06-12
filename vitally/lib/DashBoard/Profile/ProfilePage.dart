import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitally/pageTransitions/pagetransition.dart';
import 'package:vitally/Login_SignUp/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      EnterExitRoute(enterPage: UserLoginPage(), exitPage: ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: Center(
          child: RaisedButton(
            child: Text(' Logout'),
            onPressed: () {
              setState(() {
                singOutGoogle();
              });
            },
          ),
        ),
      ),
    ));
  }
}
