import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashBoard.dart';

const loginstyle = TextStyle(
  fontSize: 18,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var img = 1;
  int sign = 1;

  String loginString1 = 'Welcome Back!';
  String loginString2 = 'Join Us!';
  String str = 'Welcome Back!';
  var dividercolor1 = Color(0xFF5433FF);
  var dividercolor = Colors.white;

  double cntheight(img) {
    return img == 1 ? 100 : 75;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                  height: 230,
                  width: (MediaQuery.of(context).size.width),
                  child: Center(
                    child: Image.asset('assets/login$img.png'),
                  )),
            ),
            SizedBox(
              height: 23,
            ),
            Center(
              child: Text(
                str,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  child: Text('Login', style: loginstyle),
                  onPressed: () {
                    setState(() {
                      img = 1;
                      str = loginString1;
                    });
                  },
                ),
                FlatButton(
                    child: Text('Sign Up', style: loginstyle),
                    onPressed: () {
                      setState(() {
                        img = 2;
                        str = loginString2;
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: img == 1 ? dividercolor1 : dividercolor,
                  height: 5,
                  width: (MediaQuery.of(context).size.width) / 2.2,
                ),
                Container(
                  color: img == 1 ? dividercolor : dividercolor1,
                  height: 5,
                  width: (MediaQuery.of(context).size.width) / 2.2,
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 5),
              child: MaterialButton(
                color: dividercolor1,
                height: 60,
                minWidth: (MediaQuery.of(context).size.width) / 1.4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return img == 1 ? DashBoard() : Login();
                    }),
                  );
                },
                child: Center(
                  child: Text(
                    (img == 1 ? 'Login' : 'Sign Up'),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Text('or'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: MaterialButton(
                      color: Colors.white,
                      height: 60,
                      minWidth: (MediaQuery.of(context).size.width) / 2.6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      onPressed: () {
                        print('google');
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        child: Center(
                          child: Image.asset('assets/google_PNG19644.png'),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                  child: MaterialButton(
                    color: Color(0xFF1778F2),
                    height: 60,
                    minWidth: (MediaQuery.of(context).size.width) / 2.6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    onPressed: () {
                      print('g');
                    },
                    child: Text(
                      'Facebook',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
