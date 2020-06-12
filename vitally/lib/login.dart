import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pagetransition.dart';
import 'registration1.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'registration1.dart';

Future fetchStr() async {
  await new Future.delayed(Duration(seconds: 5), () {});
}

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  bool _spinner = false;

  final _auth = FirebaseAuth.instance;

  final _googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInwithGoogle Succeded: $user';
  }

  void singOutGoogle() async {
    await _googleSignIn.signOut();
    print('user Sign Out');
  }

  int img = 1;

  String userEmail;
  String userREmail;
  String userRPassword;
  String userPassword;
  String confirmed_password;

  bool isValidEmail = false;
  bool isValidPassword = false;

  final _formkeylogin = GlobalKey<FormState>();
  final _formkeyregister = GlobalKey<FormState>();
  var _validate = false;
  var _validate1 = false;
  bool _obscuretext = true;

  void _toggle() {
    setState(() {
      _obscuretext = !_obscuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: SizedBox(
                  height: phoneHeight / 4.06,
                  width: phoneWidth / 2.5,
                  child: Center(
                    child: Image.asset('assets/login$img.png'),
                  ),
                ),
              ),
              Padding(
                padding: paddingHeader,
                child: Text(
                  img == 1 ? 'Welcome Back!' : 'Join Us!',
                  style: loginHeader,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    child: Text('Login', style: loginTitle),
                    onPressed: () {
                      setState(() {
                        img = 1;
                      });
                    },
                  ),
                  FlatButton(
                      child: Text('Sign Up', style: loginTitle),
                      onPressed: () {
                        setState(() {
                          img = 2;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    color: img == 1 ? uiBlue : Colors.white,
                    height: phoneHeight / 162.4,
                    width: (MediaQuery.of(context).size.width) / 2.2,
                  ),
                  Container(
                    color: img == 1 ? Colors.white : uiBlue,
                    height: phoneHeight / 162.4,
                    width: (MediaQuery.of(context).size.width) / 2.2,
                  ),
                ],
              ),
              SizedBox(
                height: phoneHeight / 3.248,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10, bottom: 10),
                  child: PageView(
                    physics: new NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      img == 1
                          ? Container(
                              child: Form(
                                  key: _formkeylogin,
                                  autovalidate: _validate,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 40, 30, 15),
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          onSaved: (String email) {
                                            userEmail = email;
                                          },
                                          validator: (email) {
                                            return EmailValidator.validate(
                                                    email)
                                                ? null
                                                : 'Enter Valid Email';
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              labelText: 'Email'),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: TextFormField(
                                            onSaved: (value) {
                                              userPassword = value;
                                            },
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                labelText: 'Password',
                                                suffixIcon: IconButton(
                                                    icon: Icon(
                                                        Icons.remove_red_eye),
                                                    onPressed: () {
                                                      _toggle();
                                                    })),
                                            obscureText: _obscuretext,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          : SingleChildScrollView(
                              child: Container(
                                child: Form(
                                    key: _formkeyregister,
                                    autovalidate: _validate1,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 20, 30, 15),
                                      child: Column(
                                        children: <Widget>[
                                          TextFormField(
                                            onSaved: (value) {
                                              userREmail = value;
                                            },
                                            validator: (email) {
                                              return EmailValidator.validate(
                                                      email)
                                                  ? null
                                                  : 'Enter Valid Email';
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                                labelText: 'Email'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: TextFormField(
                                              validator: (value) {
                                                return value.length == 0
                                                    ? 'Password Cannot be empty'
                                                    : value.length < 6
                                                        ? 'Minimum 6 Charecters'
                                                        : null;
                                              },
                                              onSaved: (value) {
                                                userRPassword = value;
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  labelText: 'Password',
                                                  suffixIcon: IconButton(
                                                      icon: Icon(
                                                          Icons.remove_red_eye),
                                                      onPressed: () {
                                                        _toggle();
                                                      })),
                                              obscureText: _obscuretext,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: TextFormField(
                                              onSaved: (value) {
                                                confirmed_password = value;
                                              },
                                              validator: (confirmed) {
                                                return null;
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  labelText: 'Confirm Password',
                                                  suffixIcon: IconButton(
                                                      icon: Icon(
                                                          Icons.remove_red_eye),
                                                      onPressed: () {
                                                        _toggle();
                                                      })),
                                              obscureText: _obscuretext,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: MaterialButton(
                        onPressed: () {
                          validateemailpword();
                        },
                        color: uiBlue,
                        height: buttonHeight,
                        minWidth: (MediaQuery.of(context).size.width) / 1.4,
                        child: Text(
                          img == 1 ? 'Login' : 'Sign Up',
                          style: buttonStyle,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            color: uiGrey,
                            height: phoneHeight / 1624,
                            width: phoneWidth / 4.17,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              img == 1 ? 'OR LOGIN USING' : 'OR SIGN UP USING',
                              style: orStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            color: uiGrey,
                            height: phoneHeight / 1624,
                            width: phoneWidth / 4.17,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              elevation: 1.5,
                              height: phoneHeight / 13.54,
                              minWidth: phoneWidth / 2.678,
                              color: Color(0xFFEEEEEE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Image.asset(
                                'assets/google_PNG19644.png',
                                height: phoneHeight / 20.3,
                                width: phoneWidth / 5.357,
                              ),
                              onPressed: () {
                                setState(() {
                                  _spinner = true;
                                });
                                try {
                                  signInWithGoogle()
                                      .whenComplete(
                                          () => print('signed in successfully'))
                                      .whenComplete(
                                        () => setState(() {
                                          _spinner = false;
                                        }),
                                      );
                                } catch (e) {
                                  print(e);
                                }
                                img == 1
                                    ? null
                                    : Navigator.push(
                                        context,
                                        EnterExitRoute(
                                            enterPage: HelpUsForm(),
                                            exitPage: UserLoginPage()),
                                      );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              elevation: 2.0,
                              height: phoneHeight / 13.54,
                              minWidth: phoneWidth / 2.678,
                              color: Color(0xFF3B5998),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Text(
                                'Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Montserrat'),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                try {
                                  _googleSignIn.signOut();
                                } catch (e) {
                                  print(e);
                                  print('signed out successfully');
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateemailpword() {
    img == 1
        ? _formkeylogin.currentState.validate() ? _success() : _validate = true
        : _formkeyregister.currentState.validate()
            ? _success()
            : _validate1 = true;
  }

  void _success() async {
    if (img == 1) {
      _formkeylogin.currentState.save();
      setState(() {
        _spinner = true;
      });
      try {
        final user = await _auth
            .signInWithEmailAndPassword(
                email: userEmail, password: userPassword)
            .whenComplete(() => _spinner = false);

        if (user != null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  content: Text(
                    'Welcome Back to Vitally',
                    textAlign: TextAlign.center,
                  ),
                );
              });
          print('logged in succesfully');
        }
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                content: Text(
                  e.message,
                  textAlign: TextAlign.center,
                ),
              );
            });

        print(e);
      }
    } else if (img == 2) {
      _formkeyregister.currentState.save();
      setState(() {
        _spinner = true;
      });
      try {
        final newuser = await _auth
            .createUserWithEmailAndPassword(
                email: userREmail, password: userRPassword)
            .whenComplete(
              () => setState(() {
                _spinner = false;
              }),
            );

        if (newuser != null) {
          Navigator.push(
            context,
            EnterExitRoute(enterPage: HelpUsForm(), exitPage: UserLoginPage()),
          );
        }
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                content: Text(
                  e.message,
                  textAlign: TextAlign.center,
                ),
              );
            });

        print(e);
      }
    }
  }
}
