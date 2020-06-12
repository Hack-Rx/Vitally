import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:vitally/main.dart';

class WaterIntake extends StatefulWidget {
  @override
  _WaterIntakeState createState() => _WaterIntakeState();
}

var waterIntake = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat');

var addaDrink = TextStyle(
    color: Colors.white,
    fontFamily: 'Montserrat',
    fontSize: 18,
    fontWeight: FontWeight.w500);

class _WaterIntakeState extends State<WaterIntake> {
  int noofglasses = 1;
  int watermeter = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    int waterIn = 250;

    return Container(
      width: double.maxFinite,
//      height: height / (812 / 235),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              'Water intake',
              style: waterIntake,
            ),
          ),
          SizedBox(
            height: height / (812 / 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 150,
                width: 65,
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: LiquidLinearProgressIndicator(
                  borderRadius: 44,
                  value: watermeter.toDouble() / 1600,
                  valueColor: watermeter < 1600
                      ? AlwaysStoppedAnimation(Color(0xFF0270C0))
                      : AlwaysStoppedAnimation(Colors.redAccent),
                  backgroundColor: Color(0xFF55D6FF),
                  direction: Axis.vertical,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('$watermeter',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Text(
                        'ml',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: 165,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                color: noofglasses > 1
                                    ? uiGreen
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            onTap: () {
                              if (noofglasses > 0)
                                setState(() {
                                  noofglasses--;
                                  print(noofglasses);
                                });
                            },
                          ),
                          Container(
                            width: 67,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(17),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(25, 0, 0, 0),
                                      blurRadius: 20,
                                      offset: Offset(0.4, 1.4))
                                ]),
                          ),
                          GestureDetector(
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: uiGreen,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  noofglasses = noofglasses + 1;
                                  print(noofglasses);
                                });
                              }),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '$noofglasses' + 'x',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 3),
                          Text(
                            '250 ml',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      MaterialButton(
                        child: Text(
                          'Add Drink',
                          style: addaDrink,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        height: 40,
                        minWidth: 160,
                        color: uiGreen,
                        onPressed: () {
                          print('Add a drink Pressed');
                          setState(() {
                            watermeter = watermeter + noofglasses * waterIn;
                            noofglasses = 1;
                          });
                        },
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: height / (812 / 29),
          ),
        ],
      ),
    );
  }
}
