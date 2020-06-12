import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({@required this.uid});
  final String uid;
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double streakscore = 1;

  int lvl0;
  int lvl1;

  void levelScore() {
    setState(() {
      if (streakscore > 0 && streakscore <= 2) {
        lvl0 = 0;
        lvl1 = 1;
      } else if (streakscore > 2 && streakscore <= 7) {
        lvl0 = 1;
        lvl1 = 2;
      } else if (streakscore > 7 && streakscore <= 15) {
        lvl0 = 2;
        lvl1 = 3;
      } else if (streakscore > 15 && streakscore <= 30) {
        lvl0 = 3;
        lvl1 = 4;
      } else if (streakscore > 30 && streakscore <= 60) {
        lvl0 = 4;
        lvl1 = 5;
      } else if (streakscore > 60 && streakscore <= 120) {
        lvl0 = 5;
        lvl1 = 6;
      } else if (streakscore > 120) {
        lvl0 = 6;
        lvl1 = 7;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    levelScore();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
          Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.info_outline, color: uiBlue, size: 20),
            Text('Your Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                )),
            GestureDetector(
              onTap: () {
                print('information');
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          height: height / (812 / 524),
                          width: width / (375 / 266),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 27.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'What is Streak Score?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 21),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Streak score is the average',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat'),
                                ),
                                Text(
                                  'score of all streaks',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat'),
                                ),
                                SizedBox(height: 20),
                                Text('View your streaks in the profile section',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300)),
                                SizedBox(height: 40),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 1',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('2 points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 2',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('6 points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 3',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('11 points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 4',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('18 points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 5',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('28 points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 6',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('35 points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 7',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('50 points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32,
                                        width: 211,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Level 8',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14)),
                                              Text('75+ points',
                                                  style: TextStyle(
                                                    color: Color(0xFF5433FF),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 22),
                                Center(
                                  child: MaterialButton(
                                    height: 41,
                                    minWidth: 84,
                                    color: uiGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Icon(Icons.info_outline, color: Colors.white, size: 20),
            )
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Streak Score : ' + streakscore.toStringAsFixed(1),
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Lv. ' + lvl0.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 14,
                width: 230,
                child: StepProgressIndicator(
                  totalSteps: 2,
                  currentStep: streakscore.toInt(),
                  size: 14,
                  padding: 0,
                  selectedColor: Colors.yellow,
                  unselectedColor: Colors.grey[500],
                  roundedEdges: Radius.circular(10),
                ),
              ),
              Text(
                'Lv. ' + lvl1.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30)
      ]),
    ));
  }
}
