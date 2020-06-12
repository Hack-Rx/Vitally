import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uiGreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: uiGreen,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios, color: uiGreen, size: 30),
                    Text(' Settings',
                        style: TextStyle(
                            color: uiGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat')),
                  ],
                )),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('About Us',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat')),
              ),
              SizedBox(height: 44),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                    ),
                    Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Akshith',
                              style: TextStyle(
                                  color: uiBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 26),
                            ),
                            Text(
                              'Varma',
                              style: TextStyle(
                                  color: uiBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 26),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'III CSE, SRMIST - VDP',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'FLUTTER DEVELOPER',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: <Widget>[
                                Text('/akshithchittiveli',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                    ))
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                    ),
                    Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Shivaprasad',
                              style: TextStyle(
                                  color: uiBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 26),
                            ),
                            Text(
                              'PV',
                              style: TextStyle(
                                  color: uiBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 26),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'III CSE, SRMIST - VDP',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'UI / UX DESIGNER',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: <Widget>[
                                Text('/visualsbyshiva',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                    ))
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                    ),
                    Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Siddath',
                              style: TextStyle(
                                  color: uiBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 26),
                            ),
                            Text(
                              'Raghavan',
                              style: TextStyle(
                                  color: uiBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 26),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'III CSE, SRMIST - VDP',
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'BACK-END DEVELOPER',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: <Widget>[
                                Text('/siddath',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                    ))
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
