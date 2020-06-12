import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitally/pageTransitions/pagetransition.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/userRegistration/registration2.dart';

const headertext = TextStyle(
    fontSize: 25,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: Colors.black);
const NumberText = TextStyle(
    fontSize: 51,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    color: uiGreen);
const subtext = TextStyle(
    fontSize: 15,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: Colors.grey);

class GetTOKnowYourself extends StatefulWidget {
  final double height;
  final double weight;
  final int age;
  final int gender;
  final int dailyactivity;

  GetTOKnowYourself(
      {this.height, this.weight, this.age, this.gender, this.dailyactivity});

  @override
  _GetTOKnowYourselfState createState() => _GetTOKnowYourselfState();
}

class _GetTOKnowYourselfState extends State<GetTOKnowYourself> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  final _auth = FirebaseAuth.instance;
  FirebaseUser registereduser;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    registereduser = user;
  }

  double bmi(double a, double b) {
    double calc = (a / ((b / 100) * (b / 100)));
    double calc_ = num.parse(calc.toStringAsFixed(1));
    return calc_;
  }

  double bmr(double weight, double height, int age, int gender) {
    if (gender == 1)
      return ((10 * weight) + (6.2 * height) - (5 * age) + 5);
    else
      return ((10 * weight) + (6.2 * height) - (5 * age) - 161);
  }

  double dailyCaloriRequirement(int dailyactivity) {
    if (dailyactivity == 1) {
      return bmr(widget.weight, widget.height, widget.age, widget.gender) * 1.3;
    } else if (dailyactivity == 2) {
      return bmr(widget.weight, widget.height, widget.age, widget.gender) *
          1.55;
    } else if (dailyactivity == 3) {
      return bmr(widget.weight, widget.height, widget.age, widget.gender) *
          1.80;
    } else if (dailyactivity == 4) {
      return bmr(widget.weight, widget.height, widget.age, widget.gender) *
          2.00;
    } else {
      return bmr(widget.weight, widget.height, widget.age, widget.gender);
    }
  }

  double dailcal() {
    return dailyCaloriRequirement(widget.dailyactivity);
  }

  String weightrange(double a) {
    if (a <= 148)
      return '44 - 45';
    else if (a <= 150)
      return '49 - 61';
    else if (a <= 152)
      return '50 - 62';
    else if (a <= 154)
      return '51 - 64';
    else if (a <= 156)
      return '52 - 66';
    else if (a <= 158)
      return '54 - 67';
    else if (a <= 160)
      return '55 - 69';
    else if (a <= 162)
      return '56 - 71';
    else if (a <= 164)
      return '58 - 72';
    else if (a <= 168)
      return '59 - 74';
    else if (a <= 170)
      return '61 - 76';
    else if (a <= 172)
      return '62 - 77';
    else if (a <= 174)
      return '63 - 79';
    else if (a <= 178)
      return '65 - 81';
    else if (a <= 180)
      return '66 - 83';
    else if (a <= 182)
      return '68 - 85';
    else if (a <= 184)
      return '69 - 86';
    else if (a <= 188)
      return '71 - 88';
    else if (a <= 190)
      return '72 - 90';
    else if (a <= 192)
      return '74 - 92';
    else if (a <= 194)
      return '75 - 94';
    else if (a <= 198)
      return '77 - 96';
    else if (a <= 200)
      return '80 - 100';
    else if (a <= 202)
      return '82 - 102';
    else if (a <= 204)
      return '83 - 104';
    else
      return '83 - 104';
  }

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Get to Know",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      'Yourself',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                    )
                  ],
                ),
                SizedBox(
                    height: phoneHeight / 6.77,
                    width: phoneWidth / 3.4,
                    child: Image.asset('assets/asset1.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SizedBox(
                height: phoneHeight / 2.9,
                width: phoneWidth / 1.171,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Your BMI is',
                          textAlign: TextAlign.left,
                          style: headertext,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            bmi(widget.weight, widget.height).toString() +
                                ' Kg/m\u00b2',
                            textAlign: TextAlign.left,
                            style: NumberText,
                          ),
                        ),
                        Text(
                          'Healthy BMI range: 18.5 - 24.9',
                          style: subtext,
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ideal weight for you is',
                            textAlign: TextAlign.left,
                            style: headertext,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              idealBodyWeight(widget.gender, widget.height)
                                      .toString() +
                                  ' Kg',
                              textAlign: TextAlign.left,
                              style: NumberText,
                            ),
                          ),
                          Text(
                            'Healthy weight range: ' +
                                weightrange(widget.height),
                            style: subtext,
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            MaterialButton(
              elevation: 0.5,
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
              onPressed: () async {
                print('object');
                try {
                  await userDataHelpUsForm(uid: registereduser.uid)
                      .updateInitialBMI(bmi(widget.weight, widget.height),
                          idealBodyWeight(widget.gender, widget.height))
                      .whenComplete(() => Navigator.push(
                            context,
                            EnterExitRoute(
                                enterPage: Registration2(
                                  height: widget.height,
                                  dailycalorierequirement1: dailcal(),
                                  weight: widget.weight,
                                ),
                                exitPage: GetTOKnowYourself()),
                          ));
                } catch (e) {
                  print(e);
                }
              },
              height: phoneHeight / 13.53,
              minWidth: phoneWidth / 1.205,
              color: uiGreen,
            ),
          ],
        ),
      ),
    );
  }

  int idealBodyWeight(int a, double b) {
    if (a == 1) {
      if (b <= 152.4)
        return 50;
      else if (b <= 154.94)
        return 52;
      else if (b <= 157.48)
        return 55;
      else if (b <= 160.02)
        return 57;
      else if (b <= 162.56)
        return 59;
      else if (b <= 165.1)
        return 62;
      else if (b <= 167.64)
        return 64;
      else if (b <= 170.18)
        return 66;
      else if (b <= 172.72)
        return 68;
      else if (b <= 175.26)
        return 71;
      else if (b <= 177.8)
        return 73;
      else if (b <= 180.34)
        return 75;
      else if (b <= 182.88)
        return 78;
      else if (b <= 185.42)
        return 80;
      else if (b <= 187.96)
        return 82;
      else if (b <= 190.5)
        return 85;
      else if (b <= 193.04)
        return 87;
      else if (b <= 195.58)
        return 89;
      else if (b <= 198.12)
        return 91;
      else if (b <= 200.66)
        return 94;
      else if (b <= 203.2)
        return 96;
      else
        return 96;
    } else {
      if (b <= 152.4)
        return 46;
      else if (b <= 154.94)
        return 48;
      else if (b <= 157.48)
        return 50;
      else if (b <= 160.02)
        return 52;
      else if (b <= 162.56)
        return 55;
      else if (b <= 165.1)
        return 57;
      else if (b <= 167.64)
        return 59;
      else if (b <= 170.18)
        return 62;
      else if (b <= 172.72)
        return 64;
      else if (b <= 175.26)
        return 66;
      else if (b <= 177.8)
        return 69;
      else if (b <= 180.34)
        return 71;
      else if (b <= 182.88)
        return 73;
      else if (b <= 185.42)
        return 75;
      else if (b <= 187.96)
        return 78;
      else if (b <= 190.5)
        return 80;
      else if (b <= 193.04)
        return 82;
      else if (b <= 195.58)
        return 85;
      else if (b <= 198.12)
        return 87;
      else if (b <= 200.66)
        return 89;
      else if (b <= 203.2)
        return 92;
      else
        return 92;
    }
  }
}
