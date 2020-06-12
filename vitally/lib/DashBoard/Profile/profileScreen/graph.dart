import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';

class GraphData extends StatefulWidget {
  @override
  _GraphDataState createState() => _GraphDataState();
}

class _GraphDataState extends State<GraphData> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Container(
          width: width / (375 / 331),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Weight Progress',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.5),
                      child: Text(
                        '1 Jun - 30 Jun',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            color: Colors.grey[500],
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13.5),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: height / (821 / 170),
                        width: width / (375 / 275),
                        child: Image.asset(
                          'assets/Graph.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
