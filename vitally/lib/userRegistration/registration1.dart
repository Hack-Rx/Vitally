import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitally/onBoarding/onboarding.dart';
import 'package:vitally/pageTransitions/pagetransition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';
import 'package:vitally/userRegistration/gettoknowyourself.dart';

const dialogtitle = TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600);
const titletxt = TextStyle(
    fontSize: 21, fontFamily: 'Montserrat', fontWeight: FontWeight.w600);

const pad = EdgeInsets.only(left: 30, right: 30);
const pad1 = EdgeInsets.only(top: 5, bottom: 20);
var choice = 1;

const labeltxt = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.normal);

class HelpUsForm extends StatefulWidget {
  @override
  _HelpUsFormState createState() => _HelpUsFormState();
}

class _HelpUsFormState extends State<HelpUsForm> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  final _formkey = GlobalKey<FormState>();
  var _autoval = false;
  final _auth = FirebaseAuth.instance;
  FirebaseUser registereduser;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    registereduser = user;
  }

  String username;
  int userAge = null;
  int userGender;
  double userWeight;

  double userHeight;
  String userOccupation;
  int daily;
  String userCity;
  int userHeightUnit = 1;
  int userWeightUnit = 1;
  bool _spinner = false;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: phoneHeight / 9.03,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Help us know you better',
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: (MediaQuery.of(context).size.height) + 50,
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      child: Form(
                        autovalidate: _autoval,
                        key: _formkey,
                        child: Padding(
                          padding: pad,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: pad1,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    labelStyle: labeltxt,
                                  ),
                                  validator: (username) {
                                    return username.length == 0
                                        ? 'Name cannot be empty'
                                        : (username.length < 6
                                            ? 'Name must be more than 6 charecters'
                                            : username.length > 10
                                                ? 'Name must be less than 10 charecters'
                                                : null);
                                  },
                                  onSaved: (String name) {
                                    username = name;
                                  },
                                ),
                              ),
                              Padding(
                                padding: pad1,
                                child: DropdownButtonFormField(
                                  items: <DropdownMenuItem<int>>[
                                    DropdownMenuItem(
                                      child: Text('Male'),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Female'),
                                      value: 2,
                                    ),
                                  ],
                                  decoration: const InputDecoration(
                                    labelText: 'Gender',
                                    labelStyle: labeltxt,
                                    hintText: 'Choose an option',
                                  ),
                                  onChanged: (int value) {
                                    setState(() {
                                      userGender = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: pad1,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Age',
                                    labelStyle: labeltxt,
                                  ),
                                  validator: (age) {
                                    return age.length == 0
                                        ? 'Invalid Age'
                                        : null;
                                  },
                                  onSaved: (String age) {
                                    userAge = int.parse(age);
                                  },
                                ),
                              ), //Name
                              //Age
                              Padding(
                                padding: pad1,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Weight',
                                    labelStyle: labeltxt,
                                    suffix: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: OutlineButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Choose_2Dialog(
                                              title: 'Choose units',
                                              choice1: 'kg',
                                              choice2: 'lbs',
                                            ),
                                          );
                                        },
                                        padding: EdgeInsets.all(0),
                                        disabledBorderColor: Color(0xFF00CDAC),
                                        child: Text(
                                          'kg',
                                          style: TextStyle(
                                              color: Color(0xFF00CDAC),
                                              fontSize: 10,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                  validator: (weight) {
                                    return weight.length == 0
                                        ? 'Weight cannot be Zero'
                                        : null;
                                  },
                                  onSaved: (String weight) {
                                    userWeight = double.parse(weight);
                                  },
                                ),
                              ), //weight
                              Padding(
                                padding: pad1,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'cms',
                                    labelStyle: labeltxt,
                                    suffix: SizedBox(
                                      height: 25,
                                      width: 30,
                                      child: OutlineButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Choose_2Dialog(
                                              title: 'Choose unit',
                                              choice1: 'cms',
                                              choice2: 'inches',
                                            ),
                                          );
                                        },
                                        padding: EdgeInsets.all(0),
                                        disabledBorderColor: Color(0xFF00CDAC),
                                        child: Text(
                                          'cms',
                                          style: TextStyle(
                                              color: Color(0xFF00CDAC),
                                              fontSize: 10,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                  validator: (height) {
                                    return height.length == 0
                                        ? 'Invalid Height'
                                        : null;
                                  },
                                  onSaved: (String height) {
                                    userHeight = double.parse(height);
                                  },
                                ),
                              ),
                              Padding(
                                padding: pad1,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'Occupation',
                                    labelStyle: labeltxt,
                                  ),
                                  validator: (occupation) {
                                    return occupation.length == 0 ? null : null;
                                  },
                                  onSaved: (String occupation) {
                                    userOccupation = occupation;
                                  },
                                ),
                              ),
                              Padding(
                                padding: pad1,
                                child: DropdownButtonFormField(
                                  items: <DropdownMenuItem<int>>[
                                    DropdownMenuItem(
                                      child: Text('Sedentary'),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Lightly Active'),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Moderately Active'),
                                      value: 3,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Very Active'),
                                      value: 4,
                                    )
                                  ],
                                  decoration: const InputDecoration(
                                    labelText: 'Daily Activity',
                                    labelStyle: labeltxt,
                                    hintText: 'Choose an option',
                                  ),
                                  onChanged: (int value) {
                                    setState(() {
                                      daily = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: pad1,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'City',
                                    labelStyle: labeltxt,
                                  ),
                                  validator: (occupation) {
                                    return occupation.length == 0 ? null : null;
                                  },
                                  onSaved: (String city) {
                                    userCity = city;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 25, 30, 30),
                                child: MaterialButton(
                                  child: Text(
                                    'NEXT',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onPressed: () {
                                    autoval();
                                  },
                                  height: phoneHeight / 13.54,
                                  minWidth: phoneWidth / 1.205,
                                  color: Color(0xFF00CDAC),
                                ),
                              ),
                              //daily activity
                              //weight
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void autoval() {
    _formkey.currentState.validate() ? success() : _autoval = true;
  }

  void success() async {
    _formkey.currentState.save();

    try {
      _spinner = true;
      await userDataHelpUsForm(uid: registereduser.uid)
          .updateUserData(
              username,
              userAge,
              userGender,
              userWeight,
              userWeightUnit,
              userHeight,
              userHeightUnit,
              userOccupation,
              daily,
              userCity)
          .whenComplete(() => _spinner = false)
          .whenComplete(() => Navigator.push(
                context,
                EnterExitRoute(
                    enterPage: GetTOKnowYourself(
                      height: userHeight,
                      weight: userWeight,
                      age: userAge,
                      gender: userGender,
                      dailyactivity: daily,
                    ),
                    exitPage: HelpUsForm()),
              ));
    } catch (e) {
      print(e);
    }
  }
}

// ignore: camel_case_types
class Choose_2Dialog extends StatefulWidget {
  final String choice1;
  final String choice2;
  final String title;

  Choose_2Dialog({
    @required this.title,
    @required this.choice1,
    @required this.choice2,
  });

  @override
  _Choose_2DialogState createState() => _Choose_2DialogState();
}

class _Choose_2DialogState extends State<Choose_2Dialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        elevation: 0.0,
        child: SizedBox(
          height: 230,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                child: Text(
                  widget.title,
                  style: dialogtitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                    return 1;
                  },
                  color: Uigrn,
                  height: 40,
                  minWidth: 220,
                  child: Text(
                    widget.choice1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                    return 2;
                  },
                  color: Uigrn,
                  height: 40,
                  minWidth: 220,
                  child: Text(
                    widget.choice2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
