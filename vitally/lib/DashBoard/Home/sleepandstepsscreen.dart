import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';

class UpdatatingScreen extends StatelessWidget {
  UpdatatingScreen({@required this.uicolor});
  final Color uicolor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: uicolor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: uicolor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height / (812 / 100),
            width: width,
            color: uicolor,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'We are Updating!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: height / 1.5,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 25),
                        Container(
                            height: 182,
                            width: 246,
                            child: Image.asset(
                                'assets/undraw_in_progress_ql66 1 (2).png')),
                        SizedBox(height: 25),
                        Text(
                          "Check out the currently available features",
                          style: emptylist1,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "This is a future Scope and our ",
                          style: emptyllist2,
                        ),
                        Text(
                          "team is working on it.",
                          style: emptyllist2,
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
