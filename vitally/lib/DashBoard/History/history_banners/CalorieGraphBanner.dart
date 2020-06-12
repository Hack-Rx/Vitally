import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';

class CaloriesGraph extends StatefulWidget {
  CaloriesGraph({@required this.uid});

  final String uid;

  @override
  _CaloriesGraphState createState() => _CaloriesGraphState();
}

class _CaloriesGraphState extends State<CaloriesGraph> {
  int stats = 1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 295,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Calorie Stats',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  DateTime.now().subtract(Duration(days: 7)).day.toString() +
                      ' JUN - ' +
                      DateTime.now().day.toString() +
                      ' JUN',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 37,
              width: 267,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        stats = 1;
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Intake',
                          style: TextStyle(
                              color: stats == 1
                                  ? Color(0xFF01B094)
                                  : Color(0xFFA4A4A4),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      height: 37,
                      width: 267 / 2,
                      decoration: BoxDecoration(
                        color:
                            stats == 1 ? Color(0xFF7BF9E4) : Colors.grey[300],
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        stats = 2;
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Burned',
                          style: TextStyle(
                              color: stats == 2
                                  ? Color(0xFFFF7A00)
                                  : Color(0xFFA4A4A4),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      height: 37,
                      width: 267 / 2,
                      decoration: BoxDecoration(
                          color:
                              stats == 2 ? Color(0xFFFFD885) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / (812 / 14.73),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height / (821 / 163.27),
                  width: width / (375 / 289),
                  child: stats == 1
                      ? Image.asset('assets/Calorie stats (1).png')
                      : Image.asset('assets/Calorie stats.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
