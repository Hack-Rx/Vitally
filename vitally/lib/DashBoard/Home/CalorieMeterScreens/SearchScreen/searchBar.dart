import 'package:flutter/material.dart';
import 'package:vitally/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitally/firebaseDataService/userdataformservice.dart';

class SearchBar extends StatefulWidget {
  SearchBar({@required this.uid, @required this.CaloriesConsumed});

  final int CaloriesConsumed;
  final String uid;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final nameholder = TextEditingController();
  clearsearchinput() {
    nameholder.clear();
  }

  String searchbarText;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var foodname;
    var qty;
    var totalCal;
    var totalFat;
    var totalCarbs;
    var totalProtein;
    var imgURL;

    return StreamBuilder(
        stream: Firestore.instance.collection(widget.uid).snapshots(),
        builder: (context, snapshot) {
          int dailyCal = (snapshot.data.documents[2]['DailyCal']) == null
              ? 0
              : (snapshot.data.documents[2]['DailyCal']);
          int calConsumed = widget.CaloriesConsumed;

          String url = 'https://trackapi.nutritionix.com/v2/natural/nutrients';
          Map<String, String> headers = {
            "Content-type": "application/json; charset=UTF-8",
            "x-app-key": "1d204306430cd1d924af78140db9efd5",
            "x-remote-user-id": "0",
            "x-app-id": "3f29a36d"
          };
          var response;
          String today = DateTime.now().day.toString() +
              DateTime.now().month.toString() +
              DateTime.now().year.toString();
          return StreamBuilder(
              stream: Firestore.instance
                  .collection(widget.uid)
                  .document('userData')
                  .collection('$today')
                  .snapshots(),
              builder: (context, snapshot) {
                var calories =
                    (snapshot.data.documents[0]['consumedCalories']) == null
                        ? 0
                        : (snapshot.data.documents[0]['consumedCalories']);
                var carbs = (snapshot.data.documents[0]['dailyCarbs']) == null
                    ? 0
                    : (snapshot.data.documents[0]['dailyCarbs']);
                var fats = (snapshot.data.documents[0]['dailyFat']) == null
                    ? 0
                    : (snapshot.data.documents[0]['dailyFat']);
                var protein =
                    (snapshot.data.documents[0]['dailyProtein']) == null
                        ? 0
                        : (snapshot.data.documents[0]['dailyProtein']);

                return Container(
                  height: height / (812 / 120),
                  width: width,
                  color: uiBlue,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 280,
                              height: 38,
                              child: TextField(
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    searchbarText = value;
                                  });
                                },
                                showCursor: true,
                                controller: nameholder,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 2),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(color: uiBlue)),
                                    hintText:
                                        'I had 3 eggs for breakfast / 3 eggs',
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                      color: Colors.grey[700],
                                    )),
                              ),
                            ),
                            SizedBox(width: 3),
                            GestureDetector(
                              onTap: () async {
                                if (searchbarText != null) {
                                  http.Response response1 = await http
                                      .post(url,
                                          headers: headers,
                                          body: jsonEncode(<String, String>{
                                            'query': searchbarText
                                          }))
                                      .then((value) => response = value);

                                  foodname = jsonDecode(response1.body)['foods']
                                      [0]['food_name'];
                                  qty = jsonDecode(response1.body)['foods'][0]
                                      ['serving_qty'];
                                  totalCal = jsonDecode(response1.body)['foods']
                                      [0]['nf_calories'];
                                  totalCarbs =
                                      jsonDecode(response1.body)['foods'][0]
                                          ['nf_total_carbohydrate'];
                                  totalFat = jsonDecode(response1.body)['foods']
                                      [0]['nf_total_fat'];
                                  totalProtein =
                                      jsonDecode(response1.body)['foods'][0]
                                          ['nf_protein'];
                                  imgURL = jsonDecode(response1.body)['foods']
                                      [0]['photo']['highres'];

                                  if (response1.statusCode == 200) {
                                    print(calories);
                                    setState(() {
                                      calories = calories + totalCal;
                                      fats = fats + totalFat;
                                      carbs = carbs + totalCarbs;
                                      protein = protein + totalProtein;
                                    });
                                    print(calories);
                                    userDataHelpUsForm(uid: widget.uid)
                                        .updateCalorieIntake(
                                            calories, fats, carbs, protein);

                                    userDataHelpUsForm(uid: widget.uid).FoodLog(
                                        foodname, qty, imgURL, totalCal);
                                  } else
                                    print(response1.statusCode);
//                            print(response1.body);

                                  clearsearchinput();
                                }
                              },
                              child: Container(
                                height: 38,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: uiGreen,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                          calConsumed.toString() +
                              ' of ' +
                              dailyCal.toString() +
                              ' Calories',
                          style: searchbartext)
                    ],
                  ),
                );
              });
        });
  }
}
