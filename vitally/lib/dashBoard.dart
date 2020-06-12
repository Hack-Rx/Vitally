import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitally/onboarding.dart';

const titletxt = TextStyle(
    fontSize: 21, fontFamily: 'Montserrat', fontWeight: FontWeight.w600);

const labeltxt = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.normal);

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String username;
  int userAge = null;
  int userGender;
  int userWeight;
  int userHeight;
  String userOccupation;
  int Daily;
  String userCity;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Help us know you better',
              style: titletxt,
            ),
          ),
        ),
        preferredSize: Size.fromHeight(70),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 600,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: 60,
                              maxWidth:
                                  MediaQuery.of(context).size.width / 1.2),
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
                                      : null);
                            },
                            onSaved: (String name) {
                              username = name;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 4.3),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Age',
                                  labelStyle: labeltxt,
                                ),
                                validator: (age) {
                                  return age.length == 0 ? 'Invalid Age' : null;
                                },
                                onSaved: (String age) {
                                  userAge = int.parse(age);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 1.5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Weight',
                                  labelStyle: labeltxt,
                                ),
                                validator: (weight) {
                                  return weight.length == 0
                                      ? 'Weight cannot be Zero'
                                      : null;
                                },
                                onSaved: (String weight) {
                                  userWeight = int.parse(weight);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: ButtonTheme(
                                height: 24,
                                minWidth: 24,
                                child: OutlineButton(
                                  onPressed: () {},
                                  splashColor: Colors.white,
                                  child: Text(
                                    'kg',
                                    style: TextStyle(
                                        color: Color(0xFF00CDAC),
                                        fontSize: 13,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.normal),
                                  ),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xFF00CDAC),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 1.55),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Height',
                                  labelStyle: labeltxt,
                                ),
                                validator: (height) {
                                  return height.length == 0
                                      ? 'Enter Valid Height'
                                      : null;
                                },
                                onSaved: (String height) {
                                  userHeight = int.parse(height);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: ButtonTheme(
                                height: 24,
                                minWidth: 24,
                                child: OutlineButton(
                                  onPressed: () {},
                                  splashColor: Colors.white,
                                  child: Text(
                                    'cms',
                                    style: TextStyle(
                                        color: Color(0xFF00CDAC),
                                        fontSize: 13,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.normal),
                                  ),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xFF00CDAC),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.2),
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
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.2),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Daily Activity',
                              labelStyle: labeltxt,
                            ),
                            validator: (city) {
                              return city.length == 0 ? null : null;
                            },
                            onSaved: (String city) {
                              userCity = city;
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.2),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'City',
                              labelStyle: labeltxt,
                            ),
                            validator: (city) {
                              return city.length == 0 ? null : null;
                            },
                            onSaved: (String city) {
                              userCity = city;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: MaterialButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onPressed: _validateInputs,
                  height: 60,
                  minWidth: 311,
                  color: Color(0xFF00CDAC),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    _formKey.currentState.validate()
        ? _formKey.currentState.save()
        : setState(() {
            _autoValidate = true;
          });
  }
}
