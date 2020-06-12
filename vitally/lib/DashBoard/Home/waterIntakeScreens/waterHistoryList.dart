import 'package:flutter/material.dart';

import 'package:vitally/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WaterHistory extends StatefulWidget {
  WaterHistory({@required this.uid});
  final String uid;

  @override
  _WaterHistoryState createState() => _WaterHistoryState();
}

DateTime now = DateTime.now();

class _WaterHistoryState extends State<WaterHistory> {
  int month = now.month;
  int date = now.day;
  int year = now.year;
  int hour = now.hour;
  int min = now.minute;
  int sec = now.second;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().day.toString() +
        DateTime.now().month.toString() +
        DateTime.now().year.toString();
    String time = DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString() +
        ':' +
        DateTime.now().second.toString();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> History2 = [
      SizedBox(height: 200),
      Center(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 120,
            width: 341,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "TIP OF THE DAY",
                        style: emptylist1,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Before Dark",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Not Long until dinner, drink a glass",
                        style: emptyllist2,
                      ),
                      Text(
                        "or two of water",
                        style: emptyllist2,
                      ),
                    ],
                  ),
                  Container(
                      width: 99,
                      height: 80,
                      child: Image.asset('assets/Character (1).png'))
                ],
              ),
            )),
      ),
    ];
    int length = 0;
    getlength() async {
      await Firestore.instance
          .collection(widget.uid)
          .document('userData')
          .collection('$today')
          .document('WaterConsumed')
          .collection('WaterLog')
          .getDocuments()
          .then((value) => length = value.documents.length);
    }

    List<Widget> History = [];
    return StreamBuilder(
        stream: Firestore.instance
            .collection(widget.uid)
            .document('userData')
            .collection('$today')
            .document('WaterConsumed')
            .collection('WaterLog')
            .snapshots(),
        builder: (context, snapshot) {
          List<Widget> startfunction() {
            getlength();
            if (length > 0)
              for (int i = length - 1; i > 0; i--) {
                {
                  print(length);
                  print(snapshot.data.documents[i].documentID.toString());
                  History.add(HistoryItem(
                    time: snapshot.data.documents[i].documentID.toString(),
                    remaining: snapshot.data.documents[i]['RemainingQty'],
                    qty: snapshot.data.documents[i]['Quantity'],
                  ));
                }
              }
            return History + History2;
          }

          List<Widget> History3 = [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "History",
                    style: nonemptylist1,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.autorenew,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        startfunction();
                      });
                    },
                  )
                ],
              ),
            ),
          ];

          return Expanded(
              child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: History3 + startfunction(),
              ),
            ),
          ));
        });
  }
}

class HistoryItem extends StatelessWidget {
  HistoryItem({this.time, this.qty, this.remaining});
  final String time;
  final int qty;
  final int remaining;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(child: Image.asset('assets/Glass (1).png')),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      time,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 2),
                    Text(
                      remaining.toString() + ' ml remaining to drink',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      qty.toString(),
                      style: TextStyle(
                          color: uiGreen,
                          fontFamily: 'Montserrat',
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'ml',
                      style: TextStyle(
                          color: uiGreen,
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
